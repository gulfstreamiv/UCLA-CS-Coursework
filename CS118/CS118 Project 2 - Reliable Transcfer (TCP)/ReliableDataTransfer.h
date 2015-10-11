#ifndef RDTConn
#define RDTConn
#include <netinet/in.h> 
#include <string> 

#define MTU 1024 
#define IP_HEADER 20
#define UDP_HEADER 8
#define MSS (MTU - IP_HEADER - UDP_HEADER) 

#define ACKSYN_MASK 1 << 7;
#define EOFACK_MASK 1 << 6; 
#define EOF_MASK    1 << 5; 
#define FINACK_MASK 1 << 4; 
#define SYNACK_MASK 1 << 3; 
#define ACK_MASK    1 << 2;
#define SYN_MASK    1 << 1;
#define FIN_MASK    1 << 0;

#define RDT_UNIQUE_ID 0xCABBA6E5
#define RDT_TIMEOUT_SEC 0
#define RDT_TIMEOUT_USEC 500000 // 500ms
#define USEC_CONVERSION 1000000

#define MAX_TRANSMIT_TIMEOUTS 40
#define MAX_HANDSHAKE_TIMEOUTS 3
#define MAX_DUPLICATE_ACK 3

class ReliableTransferProtocol {
public:
    ReliableTransferProtocol(int w_size, double ploss = 0, double pcorrupt = 0);
    virtual ~ReliableTransferProtocol();

    bool connect( std::string const &afnet_address, int port );
    void close();
    bool listen( int port );
    bool accept();

    bool transmit_data( std::string const &data );
    bool receive_data( std::string &data );

    int port_number();

private:
    bool is_listener;
    bool listener_connected;
    bool got_FIN;
    int sock_fd;
    sockaddr_in remote_addr;
    sockaddr_in local_addr;

    size_t const window_size;

    double const simulated_loss_rate; // simulate packet loss, 0 - 100 inclusive
    double const simulated_corrupt_rate; // simulate packet corruption, 0 - 100 inclusive

    struct rdt_header_t {
        uint32_t cypher; // Used for packet alignment when reading from network
        uint16_t source_port_num;
        uint16_t destination_port_num;
        uint32_t seq_num;
        uint32_t ack_num;
        uint16_t data_len;
        uint16_t types; 
    };

    // Do not exceed the max MSS allowed
    struct rdt_packet_t {
        rdt_header_t header;
        char data[ MSS - sizeof(rdt_header_t) ];
    };

    bool if_packet_EOFACK(rdt_packet_t &pkt) { return pkt.header.types & EOFACK_MASK; }
    bool if_packet_EOF(rdt_packet_t &pkt) { return pkt.header.types & EOF_MASK; }
    bool if_packet_FINACK(rdt_packet_t &pkt) { return pkt.header.types & FINACK_MASK; }
    bool if_packet_SYNACK(rdt_packet_t &pkt) { return pkt.header.types & SYNACK_MASK; }
    bool if_packet_ACK(rdt_packet_t &pkt) { return pkt.header.types & ACK_MASK; }
    bool if_packet_SYN(rdt_packet_t &pkt) { return pkt.header.types & SYN_MASK; }
    bool if_packet_FIN(rdt_packet_t &pkt) { return pkt.header.types & FIN_MASK; }
	bool if_packet_ACKSYN(rdt_packet_t &pkt) { return pkt.header.types & ACKSYN_MASK; }

    void make_packet_EOFACK(rdt_packet_t &pkt) { pkt.header.types |= EOFACK_MASK; }
    void make_packet_EOF(rdt_packet_t &pkt) { pkt.header.types |= EOF_MASK; }
    void make_packet_FINACK(rdt_packet_t &pkt) { pkt.header.types |= FINACK_MASK; }
    void make_packet_SYNACK(rdt_packet_t &pkt) { pkt.header.types |= SYNACK_MASK; }
    void make_packet_ACK(rdt_packet_t &pkt) { pkt.header.types |= ACK_MASK; }
    void make_packet_SYN(rdt_packet_t &pkt) { pkt.header.types |= SYN_MASK; }
    void make_packet_FIN(rdt_packet_t &pkt) { pkt.header.types |= FIN_MASK; }
	void make_packet_ACKSYN(rdt_packet_t &pkt) { pkt.header.types |= ACKSYN_MASK; }

    int  construct_packet(rdt_packet_t &pkt, std::string const &data, size_t max_data_len = 0, size_t data_offset = 0);
    bool send_packet(rdt_packet_t const &pkt);
    bool process_packet(rdt_packet_t &pkt, bool verify_remote = true, sockaddr_in *ain = NULL);
    void discard_packet(rdt_packet_t &pkt, std::string const &reason);

    bool connect(std::string const &afnet_address, int port, bool sendSYNACK);
    bool bind(int port = 0);
    void close(bool force_teardown);

    void log_info(std::string const &msg);
};

#endif