# Monitoring HW4

### Task 1: Add memory/cpu metrics.

Modify `function memoryLoad()` to calculate the amount of memory currently used by the system as a percentage.
Modify `function cpuAverage()` to calculate the amount of load the cpu is under as a percentage (see [`systeminformation.currentLoad`](https://www.npmjs.com/package/systeminformation#8-current-load-processes--services)).


Once you've completed your code updates, you can test it out by registering your computer as client. Simply run the agent as follows:

```
cd agent/
node index.js computer
```

You should be able to verify your metrics being displayed in the dashboard. Recall, you should have `node bin/www` running inside the monitor VM.

##### Install agent on servers.

You can deploy this agent to run on your servers by using the `push` command provided in the driver:

```bash
cd servers/
node index.js push
```

You should see memory/cpu information being displayed in the dashboard for all the servers, including your computer.

## Working Code Block ##

```javascript
// TASK 1:
class Agent
{
    async memoryLoad()
    {
       // console.log( os.totalmem(), os.freemem() );
       let avgMem = 0;
     await si.mem().then(data => {
         avgMem = (data.used / data.total) * 100;
         avgMem = Math.round(avgMem * 100 ) / 100; //round to nearest 100th
        });
       return avgMem;   
    }
    async cpu()
    {
       let load = await si.currentLoad();
       return Math.trunc(load.currentload * 100) / 100;
    }
}
```

### Task 2: Latency and HTTP status codes.

Collecting metrics related to availability and efficiency of services often requires an external third-party. Here, the monitor service will be extended to collect data related to latency and service status.

Extend the code inside `dashboard/metrics/index.js` to collect the latency and status code of the http response (`res.statusCode`).

```js
	// LATENCY CHECK
	var latency = setInterval( function () 
	{
		...
				got(server.url, {timeout: 5000, throwHttpErrors: false}).then(function(res)
		...
```

Restart the monitoring service, you should see the dashboard display latency information.

## Working Code Block ##

```javascript
// Make request to server we are monitoring.
const stopwatch = new Stopwatch(true);
got(server.url, {timeout: 5000, throwHttpErrors: false}).then(function(res)
{
	// TASK 2
	captureServer.statusCode = res.statusCode;
	captureServer.latency = stopwatch.read(2);
}).catch( e => 
{
	// console.log(e);
	captureServer.statusCode = e.code;
	captureServer.latency = 5000;
});
```

### Task 3: Calculate and display server health.

You want to make an overall assessment of a server's health. We will be using our four metrics to calculate an overall health score (4 being good healthy and 0 being unhealthy).

Update the code inside `dashboard/metrics/index.js#updateHealth(server)` to 
create a metric that calculates an overall score from memoryLoad, cpu, latency, and statusCode.

You should see the dashboard reflect the health of your servers in the server status field, as well as sparkline update to indicate the changes in score's trend per server.

## Working Code Block ##

```javascript
function updateHealth(server)
{
	let score = 0;
	// Update score calculation.
	let pts_memoryLoad = 1 - (server.memoryLoad / 100);
	let pts_cpu = 1 - (server.cpu / 100);
	let pts_statusCode = server.statusCode == 200 ? 1 : 0;
	let latency_err = Math.abs(server.latency - 15) / 15;
	let pts_latency = server.latency <= 15 ? 1 : latency_err > 0 && latency_err <= 1 ? 1 - latency_err : 0;

	score = pts_memoryLoad + pts_cpu + pts_statusCode + pts_latency;

	server.status = score2color(score/4);

	console.log(`${server.name} ${score}`);

	// Add score to trend data.
	server.scoreTrend.push( (4-score));
	if( server.scoreTrend.length > 100 )
	{
		server.scoreTrend.shift();
	}
}
```

### Task 4: Load services.

#### Tak4 is demonentrated, as well as previous tasks, in screencast video [here.](https://drive.google.com/open?id=1HVyPc6BMNE0xMI6lJ9Ve5YtPPYTl5frW)

From your host computer, you should be able to visit `http://localhost:9001/work` in your browser, or make a curl request `curl http://localhost:9001/work` and see corresponding changes in the metrics from your dashboard.

Notice the impact of the workload based on hitting different endpoints:

* http://localhost:9001/
* http://localhost:9001/stackless
* http://localhost:9001/work


##### Can we create a even bigger load?

Siege is a tool for performing load testing of a site.

```
vagrant@ubuntu-bionic:/bakerx/metrics$ siege -b -t30s http://172.30.164.193:9001/
** SIEGE 4.0.4
** Preparing 25 concurrent users for battle.
The server is now under siege...
Lifting the server siege...
Transactions:                  34088 hits
Availability:                 100.00 %
Elapsed time:                  29.10 secs
Data transferred:               0.39 MB
Response time:                  0.02 secs
Transaction rate:            1171.41 trans/sec
Throughput:                     0.01 MB/sec
Concurrency:                   24.63
Successful transactions:       34088
Failed transactions:               0
Longest transaction:            0.53
Shortest transaction:           0.00
```

##### Installing siege

Mac: `brew install siege`  
Linux: `apt-get install siege`  
Windows: Install inside the monitor server (`bakerx ssh monitor`). Note: You should use the ip of your host computer (see dashboard/metrics/ip.txt) instead of localhost to create the desired effect.

Experiment with loading the server by hitting different endpoints. Can you cause the service to timeout?
```
siege -b -t30s http://localhost:9001/
siege -b -t30s http://localhost:9001/stackless
siege -b -t30s http://localhost:9001/work
```

##### Screencast #####
[Video Link](https://drive.google.com/open?id=1HVyPc6BMNE0xMI6lJ9Ve5YtPPYTl5frW)

### Conceptual Deployment Questions

1. Compare a channel deployment model with a ring deployment model.
   
   Channel deployment will pass through various testing channel composed of small test teams. Where as the Ring Deployment, changes are prompted to different types of users, with each ring becoming increasingly larger.

2. Identify 2 situations where an expand/contract deployment could be useful.

   You need to implement changes to database that could block transactions.
   With this process, you can add the changes in stages, adding a column to db. Then you can change
   your code to reference the new column, and go back and drop the old column later.

   Making schema changes to Amazon Market Place db. The db needs to be up 100% of the time, using expand/contract, changes could be placed in along side of current schema, the columns and code added, and later removing the older columns from db.

3. What are some tradeoffs associated with dark launches?

   Allows you to disable features, via Feature Flags, if problems to start to arise. This will also making rollbacks obsolete.
   However, users can have mixed experiences due to certain users have flags turned on while others users can have the flags turned off.
   In addition, the deployment type can create technical debt in that old flags can remain in the system potential leading to disatorous consequences.

4. Describe the Netflix style green-blue deployment. What can canary analysis tell us?

	Netflix, renaming the green-blue deployment red-black to match company color scheme, first build the package
	on a AWS image. The second step, Netflix will use spinnaker to launch the servers into production. The third step, the load balancer will keep reference to the older working micros service, for failback, while pushing new traffic to the new services.
	Although, Netflix, does not perform Canary releases, they do use Canary Analysis. Canary Analsyis have metrics that compare recent updates to previous metrics collected. If the performance of recent updates start to degrade these metrics, Netflix can be aware of it.
