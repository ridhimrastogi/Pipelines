// websocket server that dashboard connects to.
const redis = require('redis');
const got = require('got');
const fs = require('fs');
const path = require('path');
//var Prod = require("../../servers/commands/serve.js");

// // We need your host computer ip address in order to use port forwards to servers.
// let ip = ''
// try
// {
// 	ip = fs.readFileSync(path.join(__dirname,'ip.txt')).toString();
// }
// catch(e)
// {
// 	console.log(e);
// 	throw new Error("Missing required ip.txt file");
// }
/// Servers data being monitored.
// var servers =
// [
// 	{name: "computer", status: "#cccccc", scoreTrend : []},
// 	{name: "alpine-01",url:`http://${ip}:9001/`, status: "#cccccc",  scoreTrend : [0]},
// 	{name: "alpine-02",url:`http://${ip}:9002/`, status: "#cccccc",  scoreTrend : [0]},
// 	{name: "alpine-03",url:`http://${ip}:9003/`, status: "#cccccc",  scoreTrend : [0]}
// ];

var servers = {
	server: [
		{name: "blue",url:'http://192.168.44.25:3000/preview',avgcpuload: [],lastResponseCode: 0},
		{name: "green",url:'http://192.168.44.30:3000/preview',avgcpuload: [],lastResponseCode: 0}
	],
	get serversInfo(){
		return this.server;
	},
	set serversInfo(setter){
		this.server[setter.idx].lastResponseCode = setter.responseCode;
	}
};


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
				socket.emit("heartbeat", servers.server);
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
	for( var server of servers.server )
	{
		// The name of the server is the name of the channel to recent published events on redis.
		client.subscribe(server.name);
	}
	//When an agent has published information to a channel, we will receive notification here.
	client.on("message", function (channel, message)
	{
		console.log(`Received message from agent: ${channel}`)
		for( var server of servers.server )
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

	// LATENCY CHECK
	// var latency = setInterval( function ()
	// {
	// 	for( var server of servers )
	// 	{
	// 		if( server.url )
	// 		{
	// 			let now = Date.now();

	// 			// Bind a new variable in order to for it to be properly captured inside closure.
	// 			let captureServer = server;

	// 			// Make request to server we are monitoring.
	// 			got(server.url, {timeout: 5000, throwHttpErrors: false}).then(function(res)
	// 			{
	// 				// TASK 2
	// 				console.log(server.name + " " + res.timings.end - res.timings.start);
	// 				captureServer.statusCode = res.statusCode;
	// 				captureServer.latency = Date.now() - now;
	// 			}).catch( e =>
	// 			{
	// 				// console.log(e);
	// 				captureServer.statusCode = e.code;
	// 				captureServer.latency = 5000;
	// 			});
	// 		}
	// 	}
	// }, 10000);
}


function recordHealth(instance){
	client.subscribe(instance);
	client.on("message", function (channel, message)
	{
		console.log(`Received message from agent: ${channel}`)
		for( var server of module.exports.servers )
		{
			// Update our current snapshot for a server's metrics.
			if( server.name == channel && server.name == instance)
			{
				let payload = JSON.parse(message);
				server.memoryLoad = payload.memoryLoad;
				server.cpu = payload.cpu;
				updateHealth(server);
			}
		}
	});
}


// TASK 3
function updateHealth(server)
{
	let score = 0;
	// Update score calculation.

	console.log(server);
	if(server.cpu > 5)
		server.avgcpuload.push(server.cpu);

	// if(server.cpu <= 70)
	// 	score++;
	// if(server.memoryLoad <= 80)
	// 	score++;
	// // server.status = score2color(score/4);
	// console.log(`${server.name} ${score}`);

	// // Add score to trend data.
	// server.scoreTrend.push( (4-score));
	// if( server.scoreTrend.length > 100 )
	// {
	// 	server.scoreTrend.shift();
	// }
}

// function score2color(score)
// {
// 	if (score <= 0.25) return "#ff0000";
// 	if (score <= 0.50) return "#ffcc00";
// 	if (score <= 0.75) return "#00cc00";
// 	return "#00ff00";
// }

module.exports.start = start;
module.exports.servers = servers;