// websocket server that dashboard connects to.
const redis = require('redis');
const got = require('got');
const fs = require('fs');
const path = require('path');

const express = require('express');
const app = express();
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))
app.listen(port, () => console.log(`Example Monitor app listening at http://localhost:${port}`))

// We need your host computer ip address in order to use port forwards to servers.

/// Servers data being monitored.
var servers =
[
	{name: "blue",url:'http://192.168.44.25:3000/preview',avgcpuload: 0,responseCode: 0},
	{name: "green",url:'http://192.168.44.30:3000/preview',avgcpuload: 0,responseCode: 0}
];

function start(app)
{
    console.log()
	/////////////////////////////////////////////////////////////////////////////////////////
	// REDIS SUBSCRIPTION
	/////////////////////////////////////////////////////////////////////////////////////////
	let client = redis.createClient(6379, 'localhost', {});
	// We subscribe to all the data being published by the server's metric agent.
	for( var server of servers )
	{
		// The name of the server is the name of the channel to recent published events on redis.
		client.subscribe(server.name);
	}

	// When an agent has published information to a channel, we will receive notification here.
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

	// LATENCY CHECK
	var latency = setInterval( function ()
	{
		for( var server of servers )
		{
			if( server.url )
			{
				let now = Date.now();

				// Bind a new variable in order to for it to be properly captured inside closure.
				let captureServer = server;

				// Make request to server we are monitoring.
				got(server.url, {timeout: 5000, throwHttpErrors: false}).then(function(res)
				{
					// TASK 2
					console.log(res.timings.end - res.timings.start);
					captureServer.statusCode = res.statusCode;
					captureServer.latency = Date.now() - now;
				}).catch( e => 
				{
					// console.log(e);
					captureServer.statusCode = e.code;
					captureServer.latency = 5000;
				});
			}
		}
	}, 10000);
}

// TASK 3
function updateHealth(server)
{
	let score = 0;
	// Update score calculation.

	console.log(server);
	if(server.cpu <= 70)
		score++;
	if(server.memoryLoad <= 80)
		score++;
	if(server.statusCode === undefined || (server.statusCode >= 200 && server.statusCode < 300))
		score++;
	if(server.latency === undefined || server.latency < 5000)
		score++;
	server.status = score2color(score/4);

	console.log(`${server.name} ${score}`);

	// Add score to trend data.
	server.scoreTrend.push( (4-score));
	if( server.scoreTrend.length > 100 )
	{
		server.scoreTrend.shift();
	}
}

function score2color(score)
{
	if (score <= 0.25) return "#ff0000";
	if (score <= 0.50) return "#ffcc00";
	if (score <= 0.75) return "#00cc00";
	return "#00ff00";
}

function main(){
    start(app);
}