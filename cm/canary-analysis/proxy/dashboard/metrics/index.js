// websocket server that dashboard connects to.
const redis = require('redis');
const got = require('got');
const fs = require('fs');
const path = require('path');

var servers =
[
		{name: "blue",url:'http://192.168.44.25:3000/preview' ,responseCode: 0},
		{name: "green",url:'http://192.168.44.30:3000/preview',responseCode: 0}
];

function start(app)
{
	////////////////////////////////////////////////////////////////////////////////////////
	// DASHBOARD
	////////////////////////////////////////////////////////////////////////////////////////
	const io = require('socket.io')(3000);
	// Force websocket protocol, otherwise some browsers may try polling.
	io.set('transports', ['websocket']);
	// Whenever a new page/client opens a dashboard, we handle the request for the new socket.
	io.on('connection', function (socket) {
        console.log(`Received connection id ${socket.id} connected ${socket.connected}`);

		if( socket.connected )
		{
			//// Broadcast heartbeat event over websockets ever 1 second
			var heartbeatTimer = setInterval( function ()
			{
				socket.emit("heartbeat", servers);
			}, 1000);

			//// If a client disconnects, we will stop sending events for them.
			socket.on('disconnect', function (reason) {
				console.log(`closing connection ${reason}`);
				clearInterval(heartbeatTimer);
			});
		}
	});

	/////////////////////////////////////////////////////////////////////////////////////////
	// REDIS SUBSCRIPTION
	/////////////////////////////////////////////////////////////////////////////////////////
	client = redis.createClient(6379, 'localhost', {});
	//We subscribe to all the data being published by the server's metric agent.
	for( var server of servers )
	{
		// The name of the server is the name of the channel to recent published events on redis.
		client.subscribe(server.name);
	}
	//When an agent has published information to a channel, we will receive notification here.
	client.on("message", function (channel, message)
	{
		console.log(`Received message from agent: ${channel}`)
		for( var server of servers )
		{
			// Update our current snapshot for a server's metrics.
			if( server.name == channel)
			{
				let payload = JSON.parse(message);
				server.memoryLoad = payload.memoryLoad;
				server.cpu = payload.cpu;
				updateHealth(server);
			}
		}
	});

	for( var server of servers )
	{
		if( server.url )
		{
			let now = Date.now();

			// Bind a new variable in order to for it to be properly captured inside closure.
			let captureServer = server;
			let dataString = fs.readFileSync('/home/vagrant/checkbox.io-micro-preview/test/resources/survey.json', 'utf8');
			got.post(server.url, { headers: {'Content-Type': 'application/json'}, body: dataString, timeout: 10000, throwHttpErrors: false}).then(function(res){
				captureServer.responseCode = res.statusCode;
				//console.log( chalk`{grey Health check on ${this.TARGET}}: ${status}`);
			});
		}
	}
}

// TASK 3
function updateHealth(server)
{
	//console.log(server);
	//Ignore idle cases
	if(server.cpu > 5){
		return fs.appendFileSync("/bakerx/cm/canary-analysis/proxy/servers/metrics.csv", "\n" + [server.name, server.cpu, server.memoryLoad, server.responseCode].join(' '));
	}
}

module.exports.start = start;
