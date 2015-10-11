//CS118 Project 2
//Bolun Hu
//Tianrui Zhang

#include "ReliableDataTransfer.h"
#include <sys/time.h> 
#include <arpa/inet.h> 
#include <unistd.h>
#include <cstdlib> 
#include <cstring> 
#include <cerrno> 
#include <iostream> 
#include <sstream> 
#include <math.h> 
#include <algorithm> 

ReliableTransferProtocol::ReliableTransferProtocol(int w_size, double ploss, double pcorrupt)
    :   window_size( w_size ),
        simulated_loss_rate( std::max(0.0, std::min(100.0, ploss)) ),
        simulated_corrupt_rate( std::max(0.0, std::min(pcorrupt, 100.0)) ),
        sock_fd( -1 ),
        got_FIN( false ),
        is_listener( false ),
        listener_connected( false )
{
    memset( &remote_addr, 0, sizeof( remote_addr ));
    memset( &local_addr, 0, sizeof( local_addr ));

    srand(time(0)); 
}

ReliableTransferProtocol::~ReliableTransferProtocol() {
    close(true); 
}


bool ReliableTransferProtocol::connect( std::string const &afnet_address, int port_num ) 
{
    return connect(afnet_address, port_num, false);
}


bool ReliableTransferProtocol::connect( std::string const &afnet_address, int port, bool sendSYNACK ) 
{
    // Listeners have already bound a socket, simply try to connect to the remote
    // If we are establishing a brand new connection, a bind is still needed
    if (!is_listener) {
        if (!bind()) {
            log_info("Failed to bind connection socket");
            return false;
        }
    }

    got_FIN = false;

    // Establish remote host info
    remote_addr.sin_family = AF_INET;
    remote_addr.sin_port = htons(port);
    if ( inet_pton(AF_INET, afnet_address.c_str(), (void *)&remote_addr.sin_addr.s_addr ) != 1 ) {
        close();
        return false;
    }

    std::stringstream ip_ss;
    ip_ss << afnet_address << ":" << port;
    std::string ip_str = ip_ss.str();
	if(sendSYNACK)
		log_info("Sending reply (SYNACK) to " + ip_str);
	else 
		log_info("Attempting to connect (sending SYN) to " + ip_str);

    // Set the socket timeout (inactivity) and bail if setting the option fails
    timeval timeout;
    timeout.tv_sec = RDT_TIMEOUT_SEC;
    timeout.tv_usec = RDT_TIMEOUT_USEC;
    if (setsockopt(sock_fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout, sizeof(timeout)) < 0) {
        close();
        log_info("failed to set socket timeout");
        return false;
    }

    // Send a SYN/SYNACK packet to the remote host
    rdt_packet_t parcel;
    construct_packet(parcel, "");
	if(sendSYNACK)
		make_packet_SYNACK(parcel);
    else
        make_packet_SYN(parcel);

    // Bail on transmission errors
    if ( !send_packet(parcel) ) {
        close();
        log_info("SYN packet transmission failed");
        return false;
    }

    // Wait until remote host SYNACKs our SYN packet
    // SYN packets sent by the remote host are replied by process_packet();
    timeval start, now;
    gettimeofday(&start, NULL);
    int delta_sec = RDT_TIMEOUT_SEC;
    int delta_usec = RDT_TIMEOUT_USEC;

    do {
        if (!sendSYNACK) 
		{
			if(process_packet(parcel) && if_packet_SYNACK(parcel)) {
				log_info("Client Connected to " + ip_str);
				return true; 
				}// Got the SYNACK, return success!
        }
		else if(sendSYNACK)
		{
			if(process_packet(parcel) && if_packet_ACKSYN(parcel)) {
				log_info("Server Connected to " + ip_str);
				return true; // Got the final ACK, return success!
				}
        }
        else if (errno == EWOULDBLOCK) 
		{
            break; // Socket timeout, fail
        }

        // Timeout for getting an ACK
        // this is different from a socket timeout as receiving
        // garbage packets would keep resetting that timer
        gettimeofday(&now, NULL);
    } while (
            now.tv_usec - start.tv_usec < delta_usec
        &&  now.tv_sec - start.tv_sec < delta_sec
    );

    // Timed out
    close();
    log_info("Connection attempt to " + ip_str + " timed out");
    return false;
}

/**
 * Creates a system socket to send and receive packets
 */
bool ReliableTransferProtocol::bind( int port ) {
    close(); // Close existing connection if any

    local_addr.sin_family = AF_INET;
    local_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    local_addr.sin_port = htons(port);

    sock_fd = socket(AF_INET, SOCK_DGRAM, 0);

    // Bind socket so we can receive incoming packets
    if (sock_fd == -1 || ::bind(sock_fd, (struct sockaddr*)&local_addr, sizeof(local_addr)) < 0) {
        close();
        return false;
    }

    // Double check what port the system gave us
    port = port_number();
    local_addr.sin_port = htons(port);
    return true;
}

/**
 * Public interface for closing connections
 *
 * It will never force listeners to tear down their sockets, which makes
 * it possible to simply close the current connection and continue to listen
 * for additional connection requests
 */
void ReliableTransferProtocol::close() {
    close(false); // do not force listeners to teardown sockets
}

void ReliableTransferProtocol::close(bool force_teardown) 
{
    // If a non connected listener tries to close the connection it will
    // get stuck as non-connected listener sockets don't have a timeout
    if ((!is_listener && sock_fd != -1) || (is_listener && listener_connected)) {
        std::stringstream ss;
        char ip_addr[INET_ADDRSTRLEN];

        inet_ntop(AF_INET, &remote_addr.sin_addr.s_addr, ip_addr, sizeof(ip_addr));
        ss << "Closing connection to " << ip_addr << ":" << ntohs(remote_addr.sin_port);
        log_info(ss.str());

        int timeout_count = 0;
        bool rcv_FINACK = false;
        bool resend_pkt = true;
        rdt_packet_t parcel;

        // Wait for the remote host to acknowledge our FIN
        while (!rcv_FINACK && timeout_count < MAX_HANDSHAKE_TIMEOUTS) 
		{
            if (resend_pkt) {
                construct_packet(parcel, "");
                make_packet_FIN(parcel);
                send_packet(parcel);
                resend_pkt = false;
            }

            if (process_packet(parcel)) 
			{
                rcv_FINACK = if_packet_FINACK(parcel);
                got_FIN = got_FIN || if_packet_FIN(parcel);
            } 
			else if (errno == EWOULDBLOCK) 
			{
                resend_pkt = true;
                timeout_count++;
            }
        }

        if (rcv_FINACK) 
		{ 
			// Successfully got a FINACK
            timeout_count = 0;
            while (!got_FIN && timeout_count < MAX_HANDSHAKE_TIMEOUTS) 
			{
                if (process_packet(parcel))
                    got_FIN = if_packet_FIN(parcel);
                else if (errno == EWOULDBLOCK)
                    timeout_count++;
            }
        } 
		else 
		{ 
			// Number of tries exhausted, assume connection is gone
            log_info("Timeout while waiting for FINACK, terminating connection");
        }

        if (!got_FIN) 
		{
            got_FIN = true;
            log_info("Timeout while waiting for FIN, terminating connection");
        } 
		else 
		{
            log_info("Connection closed");
        }
    }

    memset( &remote_addr, 0, sizeof( remote_addr ));

    // Teardown regular sockets or when listener is destroyed
    if (force_teardown || !is_listener) {
        if (sock_fd != -1)
            ::close( sock_fd );

        sock_fd = -1;
        is_listener = false;
        memset( &local_addr, 0, sizeof( local_addr ));
    }

    if (!force_teardown && is_listener) {
        // Remove the socket timeout (inactivity) to allow blocking while waiting for connections
        timeval timeout;
        timeout.tv_sec = 0;
        timeout.tv_usec = 0;
        setsockopt(sock_fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout, sizeof(timeout));

        listener_connected = false;
    }
}

/**
 * Establishes the connection object as a listener which can accept
 * arbitrary connection requests
 */
bool ReliableTransferProtocol::listen( int port ) {
    close(true); // re-establsh listener
    return is_listener = bind(port);
}

/**
 * Accepts a remote connection. If successful, caller can begin writing and reading
 * data from the object. Additional connection requests will be discarded until the
 * current connection is closed.
 *
 * If the object is a listener, function will block until a successful connection
 * is established. If it isn't a listener, function will immediately return false.
 */
bool ReliableTransferProtocol::accept() {
    char ip_addr[INET_ADDRSTRLEN];
    rdt_packet_t parcel;
    sockaddr_in incoming_addr;

    // Only established listeners can accept connections
    if (!is_listener)
        return false;
    else
        listener_connected = false;

    while ( !listener_connected ) {
        memset(&incoming_addr, 0, sizeof(incoming_addr));
        if (!process_packet(parcel, false, &incoming_addr))
            continue;

        if(if_packet_SYN(parcel)) {
            inet_ntop(AF_INET, &incoming_addr.sin_addr.s_addr, ip_addr, sizeof(ip_addr));
            std::stringstream ss;
            ss << "Connection request from " << ip_addr << ":" << parcel.header.source_port_num;
            log_info(ss.str());
            listener_connected = connect(ip_addr, parcel.header.source_port_num, true);
        } else {
            discard_packet(parcel, "non-SYN packet received when awaiting incoming connections");
        }
    }

    return listener_connected;
}

bool ReliableTransferProtocol::transmit_data( std::string const &data ) 
{
    // First, compute the number of windows we need, then create a little structure 
    // for storing pertinent information.
    size_t num_of_window = (window_size / MSS) + 1;;
    size_t win_num = 0;

    struct this_window {
	//	bool if_initialized;
        bool if_data_acked;          // Used to track if the data in this window was acknowledged.
        size_t seq_num;         // The sequence number for this particular data item.
        timeval launch_time; 
		int datalen;				// The time the data was sent on. Used for computing timeout.
    };

    struct this_window *windows = (struct this_window*)malloc(sizeof(struct this_window) * num_of_window);

    // Configure the default settings of the struct
    for (int i = 0; i < num_of_window; i++)
	{
	//	windows[i].if_initialized = true;
        windows[i].if_data_acked = true;
        windows[i].seq_num = 0;
        windows[i].launch_time.tv_sec = 0;
        windows[i].launch_time.tv_usec = 0;
    }

    size_t unacked_data_size = 0;
    size_t acked_data_size = 0;
    size_t last_ack = 0;
    uint16_t timeout_count = 0;

    size_t data_length = data.length();
    std::stringstream ss;
    ss << "Start Transmission: " << "schedule to transmit " << data_length << " bytes in total!";
    log_info(ss.str());

    rdt_packet_t parcel;
    size_t size_of_data_in_this_pkt;
    size_t size_of_data_to_send;

    bool fast_retransmit = false;
	bool sig = false;
    while (true) 
	{
        // If everything is acknowledged, we're done!
        if (acked_data_size >= data_length && acked_data_size != 0 && data_length != 0)
		{
            log_info("Transmission complete.");
            return true;
        }
		
		/**
         * To simplify things, we do this asynchronously. We first send every segment
         * the window can hold. Once we've filled the window size, we start reading.
         * We take care to not transmit over an unACKED window.
         */
        while (unacked_data_size + acked_data_size < data_length  && 
					(windows[win_num].if_data_acked)
				&& unacked_data_size < window_size) 
		{
            // We need to take care to not try to send any more data than the window will allow.
            size_of_data_to_send = std::min(data_length - unacked_data_size - acked_data_size, sizeof(parcel.data));
            size_of_data_in_this_pkt = construct_packet(parcel, data, size_of_data_to_send, acked_data_size + unacked_data_size);
            unacked_data_size += size_of_data_in_this_pkt;

            // We also need to set some clerical data for the packet--namely, the sequence number.
            // The sequence number represents the numerical ID of the /last/ byte of data in the packet.
            parcel.header.seq_num = acked_data_size + unacked_data_size;
		//	windows[win_num].if_initialized=false;
            windows[win_num].if_data_acked = false;
            windows[win_num].seq_num = parcel.header.seq_num;
			windows[win_num].datalen = parcel.header.data_len;
            gettimeofday(&windows[win_num].launch_time, NULL);
			
	//		windows[win_num].tempacknum=parcel.header.seq_num-size_of_data_to_send;
			
            if ((unacked_data_size + acked_data_size) >= data_length) {
                make_packet_EOF(parcel);
                log_info("This is the EOF packet(last data packet) for transmission.");
            }
			
			int tmp = win_num;
            // Advance the window
            win_num = (win_num + 1) % num_of_window;
			
			std::stringstream ss;
			
			if(sig)
			{
				ss <<"Window " <<tmp<< ": " << "Resending Data...";
			}
			else
			{
				ss <<"Window " <<tmp<< ": " << "Preparing to transmit packet with sequence number: " 
				<< (parcel.header.seq_num- parcel.header.data_len) 
				<<", with payload "<< size_of_data_in_this_pkt << "/"<<sizeof(parcel.data) << " bytes";
			}
            
			log_info(ss.str());
            send_packet(parcel);
			
			if(sig&&(tmp==num_of_window-1))
			{				
				sig = false;
				std::stringstream sss;
				sss << "Retransmission Ends!!";
				log_info(sss.str());
				break;
			}
        }

        /**
         * Now that we've broken out of here, we've either sent enough data, or ran out of windows.
         * To handle this, we first see if any packets have timed out in the window. If they have,
         * then we reset to that packet and begin resending. If not, we start checking for ACKs.
         */
        for (int i = 0; i < num_of_window; i++) 
		{
            timeval now;
            gettimeofday(&now, NULL);

            long delta_sec  = now.tv_sec  - windows[i].launch_time.tv_sec;
            long delta_usec = now.tv_usec - windows[i].launch_time.tv_usec;
            bool if_timed_out = delta_sec > RDT_TIMEOUT_SEC || (delta_sec == RDT_TIMEOUT_SEC && delta_usec > RDT_TIMEOUT_USEC);

            if (!windows[i].if_data_acked && if_timed_out)
			{
                // The packet has timed out. Resend it, and everything after it. To do this, set the
                // unacked_data_size to empty, and make sure every packet after is marked
                // as acked so we can write over it, and rewind the win_num index.
                unacked_data_size = 0;
				win_num = (win_num - 1) % num_of_window;

                for (int j = i; j < num_of_window; j++)
                    windows[j].if_data_acked = true;
           

                std::stringstream ss;
                ss << "Time out when expecting to receive ACK " << windows[i].seq_num << 
					" from remote host. Resending packet with sequence number " << windows[i].seq_num - windows[i].datalen
					<< " and everything after it in current windows: ";
                log_info(ss.str());
                fast_retransmit = true;
				sig = true;
                break;
            }
        }

        // Avoid reading another network packet and just resend now
        if (fast_retransmit) {
            fast_retransmit = false;
            continue;
        }

        /**
         * We've sent everything, and nothing has timed out, so let's hunt for an ACK. We're using cumilative ACKS--
         * this means that we assume the client will only ACK bytes it has received. If we receive an ACK, we mark
         * every sequence number less than it is as sent.
         */
        if (process_packet(parcel)) 
		{
            if (if_packet_FIN(parcel)) 
			{
                log_info("Send data interrupted: remote closed the connection");
                close();
                return false;
            } 
			else if (!if_packet_ACK(parcel)) {
                discard_packet(parcel, "expected ACK and received non-ACK packet.");
            }
			else 
			{
                std::stringstream ss;
                ss << "Received Data ACK " << parcel.header.ack_num;
                log_info(ss.str());

                if (parcel.header.ack_num > unacked_data_size + acked_data_size) {
                    std::stringstream ss;
                    ss << "received garbage ACK value. god " << parcel.header.ack_num << ", anticipated " << unacked_data_size << "+" << acked_data_size;
                    discard_packet(parcel, ss.str());
                    continue;
                }

                if (parcel.header.ack_num < last_ack) {
                    discard_packet(parcel, "discarding duplicate ACK");
                } 
				else 
				{
                    for (int i = 0; i < num_of_window; i++) 
					{
                        if (!windows[i].if_data_acked && windows[i].seq_num <= parcel.header.ack_num) 
						{
                            windows[i].if_data_acked = true;
							
							std::stringstream ss;
                            ss << "Marking everything before byte " 
								<< parcel.header.ack_num << " as correctly received.";
                            log_info(ss.str());
                        }
                    }
                    acked_data_size = parcel.header.ack_num;
                    unacked_data_size -= (parcel.header.ack_num - last_ack);
                    last_ack = parcel.header.ack_num;
                    timeout_count = 0;
                }
            }
        }
        else 
		{
            timeout_count++;
		//	fast_retransmit = true;
            if (timeout_count == MAX_TRANSMIT_TIMEOUTS) {
                log_info("Timeout limit reached. Giving up.");
                close();
                return false;
            }
        }
    }
}

bool ReliableTransferProtocol::receive_data( std::string &data ) 
{
    rdt_packet_t parcel;
    rdt_packet_t response_pkt;
    uint16_t timeout_count = 0;
    size_t total_bytes_received = 0;
    data = "";
    bool got_EOF = false;
    while (true) 
	{
        if (process_packet(parcel)) 
		{
            if (parcel.header.seq_num <= total_bytes_received) {
                std::stringstream ss;
                ss << "Duplicate packet with sequence number " << parcel.header.seq_num-parcel.header.data_len 
					<< " detected. Resending ACK " << total_bytes_received;
                discard_packet(parcel, ss.str());

                construct_packet(response_pkt, "");
                response_pkt.header.ack_num = total_bytes_received;
                make_packet_ACK(response_pkt);

                send_packet(response_pkt);
                continue;
            }
            else if ((int)(parcel.header.seq_num - MSS) > (int)total_bytes_received) {
                std::stringstream ss;
                ss << "packet sequence number " << parcel.header.seq_num-parcel.header.data_len 
					<< " out of desired range " << total_bytes_received << ". Resending ACK " << total_bytes_received;
                discard_packet(parcel, ss.str());

                construct_packet(response_pkt, "");
                response_pkt.header.ack_num = total_bytes_received;
                make_packet_ACK(response_pkt);

                send_packet(response_pkt);
                continue;
            }

            // If the above checks pass, this is a valid packet.
            if ( parcel.header.data_len > 0 ) {
                data.append(parcel.data, parcel.header.data_len);
            }

            timeout_count = 0;
            total_bytes_received += parcel.header.data_len;

            // Now send an ACK
            construct_packet(response_pkt, "");

            std::stringstream ss;
            ss << "Received valid/in-order packet, ACK " << parcel.header.seq_num;
            log_info(ss.str());

            response_pkt.header.ack_num = parcel.header.seq_num;
            make_packet_ACK(response_pkt);

            if (if_packet_EOF(parcel))
                make_packet_EOFACK(response_pkt);

            send_packet(response_pkt);

            if (if_packet_EOF(parcel)) {
                log_info("Received EOF packet, transmission complete.");
                got_EOF = true;
            }

            if (if_packet_FIN(parcel)) {
                log_info("Receive data interrupted: remote closed the connection");
                close();
            }

            if (if_packet_EOF(parcel) || if_packet_FIN(parcel)) {
                return got_EOF;
            }
        } 
		else 
		{
            timeout_count++;

            std::stringstream ss;
            ss << "Read timeout. Set timeout count to " << timeout_count;
            log_info(ss.str());

            if (timeout_count == MAX_TRANSMIT_TIMEOUTS) 
			{
                std::stringstream ss;
                ss << "Timeout limit " << MAX_TRANSMIT_TIMEOUTS << " exceeded. Giving up.";
                log_info(ss.str());

                return false;
            }
        }
    }
}

/**
 * Returns the port a connection is bound to or -1 on failure
 */
int ReliableTransferProtocol::port_number() {
    sockaddr_in addr;
    socklen_t addr_len = sizeof(addr);
    if ( getsockname(sock_fd, (sockaddr *)&addr, &addr_len) == -1 )
        return -1;
    else
        return ntohs( addr.sin_port );
}

/**
 * Initializes a network packet with as much specified data as the packet can hold
 * Returns the amount of data bytes placed into the packet
 */
inline int ReliableTransferProtocol::construct_packet(rdt_packet_t &parcel, std::string const &data, size_t max_data_len, size_t data_offset) {
    memset((void *)&parcel, 0, sizeof(rdt_packet_t));

    parcel.header.cypher = RDT_UNIQUE_ID;
    parcel.header.source_port_num  = ntohs(local_addr.sin_port);
    parcel.header.destination_port_num  = ntohs(remote_addr.sin_port);
    parcel.header.seq_num   = 0;
    parcel.header.ack_num   = 0;
    parcel.header.data_len  = std::max((unsigned int)0, (unsigned int)std::min(sizeof(parcel.data), data.size() - data_offset));
    parcel.header.types     = 0;

    // First, ensure the offset is valid
    if (data_offset > data.size())
        return 0;

    // Next, compute the correct length based on any caller limitations.
    parcel.header.data_len = (max_data_len == 0) ?
        parcel.header.data_len :
        std::min((uint16_t)max_data_len, (uint16_t)parcel.header.data_len);

    memcpy(&parcel.data, (data.substr(data_offset)).c_str(), parcel.header.data_len);
    return parcel.header.data_len;
}

/**
 * Sends a formatted packet to remote_addr.
 * Returns true if packet broadcasted properly, false otherwise
 */
inline bool ReliableTransferProtocol::send_packet(rdt_packet_t const &parcel) 
{
    size_t len = std::min(sizeof(rdt_header_t) + parcel.header.data_len, sizeof(rdt_packet_t));
    return len == sendto(sock_fd, &parcel, len, 0, (struct sockaddr *)&remote_addr, sizeof(remote_addr));
}

/**
 * Function will keep reading from the network until it finds (what it sees) as
 * a valid RDT packet. If no data is left (socket times out), the function will
 * return to its caller.
 *
 * Function will automatically SYNACK any SYN packets or FINACK any FIN packets. It is
 * the caller's duty to note any incoming FIN packets and take the appropriate action.
 */
bool ReliableTransferProtocol::process_packet(rdt_packet_t &parcel, bool if_affirm, sockaddr_in *specified) {
    memset(&parcel, 0, sizeof(parcel));

    sockaddr_in moren;
    sockaddr_in *recv_addr = specified ? specified : &moren;
    socklen_t recv_addr_len = sizeof(moren);

    ssize_t len = 0;
    bool if_good_header = false;
    bool if_good_pkt = false;
    bool if_good_host   = false;

    if (sock_fd == -1)
        return false;

    // First we try to find a packet header from the UDP buffer
    // We reject packets from unexpected hosts after the *entire* packet
    // is read from the UDP buffer so that we can get rid of the garbage data
    while( !if_good_pkt ) 
	{
        while( !if_good_header ) 
		{
            // Reading the header and payload in two reads seems to cause problems
            // We peek at the header to avoid popping it out of the buffer
            size_t rcv_length =  recvfrom(sock_fd, &parcel.header, sizeof(parcel.header), MSG_PEEK, (sockaddr *)recv_addr, 
			&recv_addr_len);

            // Time out, let caller handle problem
            if (rcv_length == -1 && errno == EWOULDBLOCK) {
                discard_packet(parcel, "Socket detect nothing when waiting for packet to arrive");
                return false;
            }

            // Keep reading until we get the expected size of a packet
            if (rcv_length < sizeof(parcel.header)) {
                continue; // find header loop
            } 
			else if (parcel.header.cypher == RDT_UNIQUE_ID) {
                // If the magic number is aligned we got a proper header
                if_good_header = true;
                break;
            } 
			else { 
                std::stringstream ss;
                ss << "misaligned packet! Packet will be discarded.";
                discard_packet(parcel, ss.str());

                // Reset offset if no memory was moved and allow outer loop to keep reading
                if (parcel.header.cypher != RDT_UNIQUE_ID)
                    if_good_header = false;
            }
        }

        // Note: we assume if the header has arrived, so has the rest of the packet
        // They should be sufficiently small so that it would be unlikely for the system
        // to return before the rest of the packet is received. In such a situation, treat
        // the packet as corrupted
        if (if_good_header) {
            size_t length_to_read = std::min(sizeof(parcel), parcel.header.data_len + sizeof(parcel.header));
            size_t received_len = recvfrom(sock_fd, &parcel, length_to_read, 0, NULL, NULL);

            if_good_host = recv_addr->sin_addr.s_addr == remote_addr.sin_addr.s_addr
                        && htons(parcel.header.source_port_num) == remote_addr.sin_port;

            if (received_len == -1) {
                if (errno == EWOULDBLOCK) {
                    log_info("socket timeout while receiving packet");
                    return false;
                } else {
                    log_info("unknown transmission error");
                    if_good_header = false;
                }
            } 
			else if (received_len < length_to_read) {
                discard_packet(parcel, "received packet was shorter than expected");
                if_good_header = false;
            } 
			else if (if_affirm && !if_good_host) {
                discard_packet(parcel, "packet received from unexpected host");
                if_good_header = false;
            } 
			else if ( !if_packet_EOFACK(parcel) && !if_packet_SYNACK(parcel) && 
						!if_packet_SYN(parcel) && !if_packet_ACKSYN(parcel) && !if_packet_FIN(parcel)
						&& !if_packet_FINACK(parcel) && (random() % 100 < simulated_loss_rate) ) 
			{
                // Simulate network packet loss
                // Do not apply this on EOFACK packets to avoid synchronization issues
                discard_packet(parcel, "(fake) packet lost");
                errno = EWOULDBLOCK;
                return false;
            } 
			else if ( !if_packet_EOFACK(parcel) && !if_packet_SYNACK(parcel) && 
						!if_packet_SYN(parcel) && !if_packet_ACKSYN(parcel) && !if_packet_FIN(parcel)
						&& !if_packet_FINACK(parcel) && (random() % 100 < simulated_corrupt_rate) ) 
			{
                // Simulate packet corruption
                // Do not apply this on EOFACK packets to avoid synchronization issues
                discard_packet(parcel, "(fake) packet corrupted");
                return false;
            } 
			else if (received_len == length_to_read) {
                if_good_pkt = true;
            }
        } // valid header while loop
    } // valid packet while loop

    if (if_good_pkt) {
        // If remote host we've already connected to sends a SYN packet at any point
        // (because, say, our prevoius SYNACK was discarded) SYNACK it immediately
        rdt_packet_t resp;
        construct_packet(resp, "");

        if (if_packet_SYN(parcel) && if_affirm) 
		{
            make_packet_SYNACK(resp);
            send_packet(resp);
            log_info("Received SYN packet, sending SYNACK");
        } 

        else if (if_packet_SYNACK(parcel) && if_affirm) 
		{
            make_packet_ACKSYN(resp);
            send_packet(resp);
            log_info("Received SYNACK packet, sending ACK");
        }
		
		else if (if_good_host && if_packet_FIN(parcel)) 
		{ 
			// Always ignore FIN packets from unknown hosts
            got_FIN = true;
            make_packet_FINACK(resp);
            send_packet(resp);
            log_info("Received FIN packet, sending FINACK, remote host closed connection");
        }

        return true;
    }

    return false;
}

/**
 * Writes to stdout that a packet was discarded for a given reason
 */
void ReliableTransferProtocol::discard_packet(rdt_packet_t &parcel, std::string const &reason) {
    memset(&parcel, 0, sizeof(parcel));
    log_info("discarded packet: " + (reason == "" ? "unknown error" : reason));
}

void ReliableTransferProtocol::log_info(std::string const &msg) {
    time_t now;
    char date[32];

    time(&now);
    strftime( date, sizeof(date), "%D %T: ", localtime(&now));

    std::cerr << date << msg << std::endl;
}
