#include <iostream>
#include <cstdlib>
#include <cstring> // memset, etc.
#include <signal.h>
#include <fcntl.h>
#include <unistd.h>
#include "ReliableDataTransfer.h"

#define DEFAULT_PORT 9529
#define WINDOW_SIZE 1024
#define MAX_BUF_SIZE 8192

ReliableTransferProtocol *server = NULL;

void sig_handler( int signal ) {
    std::cout << "Caught signal " << signal << ", exiting" << std::endl;

    if(server) {
        delete server;
        server = NULL;
    }

    exit(signal);
}

int main( int argc, char **argv ) {
    signal( SIGHUP, sig_handler );
    signal( SIGINT, sig_handler );
    signal( SIGTERM, sig_handler );

    int port_number = DEFAULT_PORT;
    int cwnd = WINDOW_SIZE;
    double loss_probability = 0;
    double corrup_probability = 0;

    switch (std::min(argc, 4)) {
        case 4:
            corrup_probability = atof(argv[--argc]) * 100;
        case 3:
            loss_probability = atof(argv[--argc]) * 100;
        case 2:
            cwnd = atoi(argv[--argc]);
        case 1:
            port_number = atoi(argv[--argc]);
        case 0: // program name
        default:
            break;
    }

    server = new ReliableTransferProtocol(cwnd, loss_probability, corrup_probability);

    if (!server->listen(port_number)) {
        std::cout << "server listen failed, aborting" << std::endl;
        delete server;
        server = NULL;
        exit(-1);
    } else {
        std::cout << "Listening on port number " << server->port_number() << std::endl;
    }

    std::string request_file_name;
    char buf[MAX_BUF_SIZE+1];
    memset(buf, 0, MAX_BUF_SIZE+1);

    while (true) {
        if (!server->accept())
            continue;

        server->receive_data(request_file_name);

        int fd = open(request_file_name.c_str(), O_RDONLY);
        if (fd == -1) {
            std::cout << "Invalid file \"" << request_file_name << "\" requested" << std::endl;
            server->close();
            continue;    
        }
		
		std::cout << "****************** Requested file found, preparing to transmit file data..." <<std::endl;
		
        int data_length = 0;
        std::string file_data = "";
        while( (data_length = read(fd, buf, MAX_BUF_SIZE)) > 0) {
            file_data.append(buf, data_length);
            memset(buf, 0, MAX_BUF_SIZE);
        }

        server->transmit_data(file_data);
        server->close();
    }

    return 0;
}
