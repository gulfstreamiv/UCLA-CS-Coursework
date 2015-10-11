CC = g++
CFLAGS = -g -Wall -Wextra -Werror

all: sender receiver

SERVER_SIDE_SOURCE_FILE = \
	Sender.cpp \
	ReliableDataTransfer.cpp
SERVER_SIDE_OBJ_FILE = $(subst .cpp,.o,$(SERVER_SIDE_SOURCE_FILE))

sender: $(SERVER_SIDE_OBJ_FILE)
	$(CC) $(CFLAGS) -o $@ $(SERVER_SIDE_OBJ_FILE)

CLIENT_SIDE_SOURCE_FILE = \
	Receiver.cpp \
	ReliableDataTransfer.cpp
CLIENT_SIDE_OBJ_FILE = $(subst .cpp,.o,$(CLIENT_SIDE_SOURCE_FILE))

receiver: $(CLIENT_SIDE_OBJ_FILE)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_SIDE_OBJ_FILE)


clean:
	rm -fr *.o *~ *.bak *.tar.gz core *.core *.tmp sender receiver 
