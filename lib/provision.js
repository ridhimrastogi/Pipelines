const got    = require("got");
const chalk  = require('chalk');
const os     = require('os');
const child = require('child_process');

var config = {};
// Retrieve our api token from the environment variables.
config.token = process.env.NCSU_DOTOKEN;

if( !config.token )
{
	console.log(chalk`{red.bold NCSU_DOTOKEN is not defined!}`);
	console.log(`Please set your environment variables with appropriate token.`);
	console.log(chalk`{italic You may need to refresh your shell in order for your changes to take place.}`);
	process.exit(1);
}

console.log(chalk.green(`Your token is: ${config.token.substring(0,4)}...`));

// Configure our headers to use our token when making REST api requests.
const headers =
{
	'Content-Type':'application/json',
	Authorization: 'Bearer ' + config.token
};


class DigitalOceanProvider
{
	// Documentation for needle:
	// https://github.com/tomas/needle

	async listRegions()
	{
		let response = await got('https://api.digitalocean.com/v2/regions', { headers: headers, json:true })
							 .catch(err => console.error(`listRegions ${err}`));

		if( !response ) return;

		if( response.body.regions )
		{
			for( let region of response.body.regions)
			{
				// Print out
				console.log( `Slug: ${region.slug}`);
			}
		}

		if( response.headers )
		{
			console.log( chalk.yellow(`Calls remaining ${response.headers["ratelimit-remaining"]}`) );
		}
	}

	async listImages( )
	{
		// HINT: Add this to the end to get better filter results: ?type=distribution&per_page=100
		let response = await got('https://api.digitalocean.com/v2/images?type=distribution&per_page=100', { headers: headers, json:true })
							 .catch(err => console.error(`listImages ${err}`));

		if( !response ) return;

		if( response.body.images )
		{
			for( let image of response.body.images)
			{
				// Print out
				console.log( `Image Slug: ${image.slug}`);
				for(let region of image.regions)
				{
					console.log( `	Region Slug: ${region}`)
				}
			}
		}

		if( response.headers )
		{
			console.log( chalk.yellow(`Calls remaining ${response.headers["ratelimit-remaining"]}`) );
		}
	}

	async createDroplet (dropletName, region, imageName, size_slug )
	{
		if( dropletName == "" || region == "" || imageName == "" )
		{
			console.log( chalk.red("You must provide non-empty parameters for createDroplet!") );
			return;
		}

		var data =
		{
			"name": dropletName,
			"region":region,
			"size":size_slug,
			"image":imageName,
			"ssh_keys":['de:b2:ba:7e:26:60:01:67:1b:18:ef:52:b3:ac:2a:dc'],
			"backups":false,
			"ipv6":false,
			"user_data":null,
			"private_networking":null
		};

		console.log("Attempting to create: "+ JSON.stringify(data) );

		let response = await got.post("https://api.digitalocean.com/v2/droplets",
		{
			headers:headers,
			json:true,
			body: data
		}).catch( err =>
			console.error(chalk.red(`createDroplet: ${err}`))
		);

		if( !response ) return;

		console.log(response.statusCode);
		console.log(response.body);
		return response.body.droplet;

		if(response.statusCode == 202)
		{
			console.log(chalk.green(`Created droplet id ${response.body.droplet.id}`));
		}
	}

	 async dropletInfoWait(id){
		
		let ipV4isErr = true;
		let end = Date.now() + 6000;
		let address = '0';	

		
	
		console.log("trying to get dropletinfo");
		do {
			try {					
				address = await this.dropletInfo(id);
				console.log("dropplet info: " + address);
				ipV4isErr = false;	
				// await new Promise(r => setTimeout(r, 5000));
				console.log("dropplet info: " + typeof(address));
				if (/\d+\.\d+\.\d+\.\d+/.test(address)) {
					console.log("dropplet returned info: " + address);
					return address;
				}
			} catch (error) {
				ipV4isErr = true;					
				await new Promise(r => setTimeout(r, 5000));
			}
		}while(ipV4isErr || Date.now() >= end);
	

		
		
	};	
	

	async dropletInfo (id)
	{
		if( typeof id != "number" )
		{
			console.log( chalk.red("You must provide an integer id for your droplet!") );
			return;
		}

		// Make REST request
		let response = await got(`https://api.digitalocean.com/v2/droplets/${id}`, { headers: headers, json:true })
							 .catch(err => console.error(`dropletInfo ${err}`));

		if( !response ) return;

		if( response.body.droplet )
		{
			let droplet = response.body.droplet;
			console.log(droplet);

			// Print out IP address
			let ipV4 = droplet.networks.v4[0].ip_address;
			let id = droplet.id;
			let name = droplet.name;
			try {
				
				//set varibles for current process
				//these will be destroyed on closing the shell
				//these will take effect immediatley without closing shell
				console.log(`'${name}_IP: '` + `'${ipV4}'`);
				process.env[`${name}_IP`] = `${ipV4}`;
				process.env[`${name}_ID`] = `${id}`;
				console.log("process.env.ansiblesrv_IP setting: " + process.env.ansiblesrv_IP);
				console.log("process.env.ansiblesrv_ID setting: " + process.env.ansiblesrv_ID);
				
				// process.env.ansiblesrv_IP = "asdfasdfad";
				// process.env.ansiblesrv_ID = `'${id}'`;

				//these will persist in the system environmental variables
				var result = child.spawnSync('setx', ['-m', name + "_IP", ipV4]);
				var result = child.spawnSync('setx', ['-m', name + "_ID", id]);
			} catch (error) {
				try {
					var result = child.spawnSync('export ', ['-m', name + "_IP", ipV4]);
					var result = child.spawnSync('export ', ['-m', name + "_ID", id]);
				} catch (error) {
					console.log(error);
					return error;
				}
				
			}
			

			console.log(`Droplet ID: ${id}	IP Address: ${ipV4}`)
			return ipV4;
		}

	}

	async deleteDroplet(id)
	{
		if( typeof id != "number" )
		{
			console.log( chalk.red("You must provide an integer id for your droplet!") );
			return;
		}

		// HINT, use the DELETE verb.
		let response = await got.delete(`https://api.digitalocean.com/v2/droplets/${id}`, { headers: headers, json:true })
							 .catch(err => console.error(`deleteDroplet ${err}`));

		if( !response ) return;

		// No response body will be sent back, but the response code will indicate success.
		// Specifically, the response code will be a 204, which means that the action was successful with no returned body data.
		if(response.statusCode == 204)
		{
			console.log(`Deleted droplet ${id}`);
		}

	}

	 

};

function updateIPAddresInInventory(ipAddress){
	var fs = require('fs')
	fs.readFile('..\\cm\\inventory.ini', 'utf8', function (err,data) {
	  if (err) {
		return console.log(err);
	  }
	  var result = data.replace(/\d+\.\d+\.\d+\.\d+/g, ipAddress);
	
	  fs.writeFile(someFile, result, 'utf8', function (err) {
		 if (err) return console.log(err);
	  });
	});
}

async function provision(name, size_slug)
{
	console.log(`Provision Droplet`);
	let client = new DigitalOceanProvider();


	// #############################################
	// Create an droplet with the specified name, region, and image
	// Comment out when completed. ONLY RUN ONCE!!!!!
	// var name = "UnityId"+os.hostname();
	var region = "nyc1"; // Fill one in from #1
	var image = "ubuntu-18-04-x64"; // Fill one in from #2
	var ipAddress;
	await client.createDroplet(name, region, image, size_slug).then(data => client.dropletInfoWait(data.id)).then(async function (address) {ipAddress = address;});
	// await  client.dropletInfoWait(189214152).then(function(data) {console.log(data); ipAddress = data;});
	console.log("ip from provision:" + ipAddress);
	updateIPAddresInInventory(ipAddress);

	return ipAddress;

	
}



module.exports = {createDroplet: provision }
