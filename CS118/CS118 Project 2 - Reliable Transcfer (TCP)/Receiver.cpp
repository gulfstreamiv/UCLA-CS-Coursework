#include <iostream>
#include <cstdlib>
#include <cstring> // memset, etc.
#include <signal.h>
#include <netdb.h> // hostent, etc.
#include <arpa/inet.h> // inet_htop
#include "ReliableDataTransfer.h"

#define DEFAULT_PORT 9529
#define WINDOW_SIZE 1024

ReliableTransferProtocol *establish_connection = NULL;

void handle_signal( int signal ) {
    std::cout << "Caught signal " << signal << ", exiting" << std::endl;

    if(establish_connection) {
        delete establish_connection;
        establish_connection = NULL;
    }

    exit(signal);
}

int main( int argc, char** argv ) {
    signal( SIGHUP, handle_signal );
    signal( SIGINT, handle_signal );
    signal( SIGTERM, handle_signal );

    std::string hostname = "localhost";
    int port = DEFAULT_PORT;
    std::string file_name = "";
    double pdrop = 0;
    double pcorrupt = 0;

    switch (std::min(argc, 5)) {
        case 5:
            pcorrupt = atof(argv[--argc]) * 100;
        case 4:
            pdrop = atof(argv[--argc]) * 100;
        case 3:
            file_name = argv[--argc];
        case 2:
            port = atoi(argv[--argc]);
        case 1:
            hostname = argv[--argc];
        case 0: // program name
        default:
            break;
    }

    struct hostent *hp = gethostbyname(hostname.c_str());
    char ip_address[INET_ADDRSTRLEN];
    memset(&ip_address, 0, sizeof(ip_address));

    if (hp && hp->h_length > 0) {
        inet_ntop(AF_INET, hp->h_addr_list[0], ip_address, sizeof(ip_address));
    } else {
        std::cout << "Failed to look up host named: " << hostname << ", aborting" << std::endl;
        exit(-1);
    }

    establish_connection = new ReliableTransferProtocol(WINDOW_SIZE, pdrop, pcorrupt);

    if (!establish_connection->connect(ip_address, port)) {
        std::cout << "Connection failed, aborting" << std::endl;
        exit(-1);
    }
//	std::cout << "Sending request filename to server side..." << std::endl;
    std::string server_data;
    establish_connection->transmit_data(file_name);
//	std::cout << "Begin to receive data..." << std::endl;
    establish_connection->receive_data(server_data);
    establish_connection->close();

    std::cout << server_data;
    return 0;
}