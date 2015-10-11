from twisted.internet import protocol, reactor, defer
from twisted.application import service, internet
from twisted.protocols import basic
import server
from twisted.web.client import getPage

from datetime import datetime
import time
import logging
import json

logging.basicConfig(filename='record.log', level=logging.DEBUG)

globvar = '';

alford = 'Alford'
bolden = 'Bolden'
hamilton = 'Hamilton'
parker = 'Parker'
powell = 'Powell'

server_list = {}
group = {}
group[alford] = dict(
	server_id =alford,
	neighboring_peers=(parker, powell),
)
group[bolden] = dict(
	server_id=bolden,
	neighboring_peers=(parker, powell),
)
group[hamilton] = dict(
	server_id=hamilton,
	neighboring_peers=(parker,),
)
group[parker] = dict(
	server_id=parker,
	neighboring_peers=(alford, bolden, hamilton),
)
group[powell] = dict(
	server_id=powell,
	neighboring_peers=(alford, bolden),
)

port_num = {}
port_num[alford] = 12195
port_num[bolden] = 12196
port_num[hamilton] = 12197
port_num[parker] = 12198
port_num[powell] = 12199



class ServerSideProtocol(basic.LineReceiver):

	def print_and_stop(self, output):
		global globvar
		globvar = output
		self.message(output)

	   
	def main(self, url):
		d = getPage(url)
		d.addCallback(self.print_and_stop)

	def connectionMade(self):
		logging.info(
			"%s: Got new client: %s",
			self.factory.info['server_id'],
			self.transport.client,
		)
		self.factory.clients.append(self)

	def connectionLost(self, reason):
		logging.info(
			"%s: Lost a client: %s",
			self.factory.info['server_id'],
			self.transport.client,
		)
		self.factory.clients.remove(self)

	def lineReceived(self, line):
		logging.info(
			"%s: Received '%s'",
			self.factory.info['server_id'],
			line,
		)
		self.parse_and_handle(line)

	def message(self, msg):
		logging.info(
			"%s: Sent '%s'",
			self.factory.info['server_id'],
			msg,
		)
		self.transport.write(msg + '\n')

	def parse_and_handle(self, line):
		params = line.split()
		if params[0] == 'IAMAT':
			self.handle_IAMAT(params)
		elif params[0] == "AT":
			self.handle_AT(params)
		elif params[0] == "WHATSAT":
			self.handle_WHATSAT(params)
		else: # unrecognized
			self.message("? " + line)
	
	def tweets(self, location, radius, num):
		return str('abc')

	def handle_AT(self, params):
		c_ID = params[3]
		msg = params[:6]
		time = datetime.fromtimestamp(float(params[6]))
		self.try_update_database(c_ID, msg, time)

	def handle_IAMAT(self, params):
		try:
			c_ID = params[1]
			pos = params[2]
			sending_time = datetime.fromtimestamp(float(params[3]))
		except:
			self.message("Malformed IAMAT command.")
			return

		rcv_time = datetime.now()
		delay = (rcv_time - sending_time).total_seconds()

		msg = (
			"AT",
			self.factory.info['server_id'],
			("%+f" % (delay)), ) + tuple(params[1:])
		self.message(' '.join(msg),)
		self.try_update_database(c_ID, msg, rcv_time)
		
	def handle_WHATSAT(self, params):
		database = self.factory.users
		try:
			c_ID = params[1]
			assert(c_ID in database)
			scope = int(params[2])
			assert(scope >= 0 and scope <= 50)
			max_num_places = int(params[3])
			assert(max_num_places > 0 and max_num_places <= 20)
			msg = self.fetch_info(c_ID)
			temp1 = ''
			temp2 = ''
			out = self.parse_geo(msg,temp1,temp2)
			o1 = out[0]
			o2 = out[1]
			req = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%s,%s&radius=%s&key=AIzaSyAtQHzIbUDbPIl-C3IXiIjYzBeTz1PdHcQ&sensor=false' % (o1, o2, str(scope))
			self.message(self.fetch_info(c_ID))
			self.main(req)
		except:
			self.message("Invalid WHATSAT command. Valid client name, radius, and number of places must be provided.")

	def parse_geo(self,msg,o1,o2):
		param = msg.split()
		geocode = param[4]		
		n=1
		while True:
			if geocode[n]=='+' or geocode[n]=='-':
				break
			else:
				n=n+1
		o1=geocode[:n]
		o2=geocode[n:]
		temp = [0 for x in range(2)]
		temp[0] = o1
		temp[1] = o2
		return temp
        
	
	def try_update_database(self, c_ID, msg, time):
		database = self.factory.users
		# check if there's a more recent msg in the database
		if c_ID in database and database[c_ID]['time'] >= time:
			return
		database[c_ID] = dict(msg=msg, time=time)
		self.flood_update(msg, time)
	
	def fetch_info(self, clientID):
		try:
			return ' '.join(self.factory.users[clientID]['msg'])
		except:
			return "INVALID INFO"

	def flood_update(self, msg, time):
		cf = ClientProtocolGenerator(' '.join(msg), time)
		cf.protocol = ClientSideProtocol
		for peer_id in self.factory.info['neighboring_peers']:
			logging.info(
				"%s: sending AT to %s",
				self.factory.info['server_id'],
				peer_id,
			)
			reactor.connectTCP('localhost', port_num[peer_id], cf)


class ClientSideProtocol(basic.LineReceiver):
	def connectionMade(self):
		t = self.factory.time
		self.sendLine(
			self.factory.message +
			' ' +
			str(time.mktime(t.timetuple()) + t.microsecond * 0.000001)
		)
		self.transport.loseConnection()

class ClientProtocolGenerator(protocol.ClientFactory):
	def __init__(self, message, time):
		self.message = message
		self.time = time

class ServerProtocolGenerator(protocol.ServerFactory):
	protocol = ServerSideProtocol
	def __init__(self, topology):
		self.clients = []
		self.info = topology
		self.users = {}
		
sf = protocol.ServerFactory()
sf.protocol = ServerSideProtocol
sf.clients = []

application = service.Application("group-server")

server_list[alford] = internet.TCPServer(port_num[alford], ServerProtocolGenerator(group[alford]))
server_list[alford].setServiceParent(application)

server_list[bolden] = internet.TCPServer(port_num[bolden], ServerProtocolGenerator(group[bolden]))
server_list[bolden].setServiceParent(application)

server_list[hamilton] = internet.TCPServer(port_num[hamilton], ServerProtocolGenerator(group[hamilton]))
server_list[hamilton].setServiceParent(application)

server_list[parker] = internet.TCPServer(port_num[parker], ServerProtocolGenerator(group[parker]))
server_list[parker].setServiceParent(application)

server_list[powell] = internet.TCPServer(port_num[powell], ServerProtocolGenerator(group[powell]))
server_list[powell].setServiceParent(application)

