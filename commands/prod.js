const fs = require('fs');
const path = require('path');
const chalk = require('chalk');
const provision = require('../lib/provision');


exports.command = 'prod <status>';
exports.desc = 'provision VMs';
exports.builder = yargs => {
    yargs.options({
    });
};


exports.handler = async argv => {
    const { status } = argv;

    (async () => {

        await run(status);

    })();

};

async function run(status) {    
    let promises = [];
    
    if (status == 'up') {                
        let requiredServers =[{serverName: 'monitorsrv', slug: '512mb' },{serverName: 'checkboxiosrv', slug: '512mb' },{serverName: 'itrustsrv', slug: 's-2vcpu-4gb' }];
        let serverInfos = {};
        
        console.log(chalk.blueBright('Provisioning required servers...'));
        requiredServers.forEach(server => {
            console.log(chalk.yellow('Provisioning server ' + server.serverName));
            promises.push(provision.createDroplet(server.serverName, server.slug) );
        });        
       

        await Promise.all(promises).then(function (data) { 
            for (let index = 0; index < requiredServers.length; index++) {
                let dropletInfo = data[index];                
                serverInfos[dropletInfo.name] = {id: dropletInfo.id, ip_address: dropletInfo.ip_address, name: dropletInfo.name, private_key: "csc_519_rsa_private", user: "root"};
                //console.log(`ID: ${dropletInfo.id} ServerName: ${dropletInfo.name} IP_Address: ${dropletInfo.ip_address}`);
            }            
         });

         await updateInventory(serverInfos);
         //save sever info to file
         try {
            fs.writeFileSync("cm/serverInfos.json", JSON.stringify(serverInfos))
          } catch (err) {
            console.error(err)
          }

        await new Promise(r => setTimeout(r, 30000)); //give servers time to boot


        // if( result.error ) { console.log(result.error); process.exit( result.status ); }
    } 
    else if (status == "down") {

        try {
            serverInfos = JSON.parse(fs.readFileSync("cm/serverInfos.json", 'utf8'));            
            Object.values(serverInfos).forEach(element => {                 
                promises.push(provision.destroyDroplet(element.id));
            });
            await Promise.all(promises).then(() => console.log(chalk.blueBright("Tear down complete")));
          } catch (err) {
            console.error(err)
            return false
          }

    }     
    
    else {
        console.log("Given status not supported.");
    }


}

async function updateInventory(serverInfos){
    let inventory_txt;
    let inventory_stack = [];

    serverInfos["jenkinssrv"] = {id: 0, ip_address: "192.168.33.20", name: "jenkinssrv", private_key: "js_rsa", user: "vagrant"}; //inject local jenkins server

    inventory_stack.push('[initialize]')
    Object.values(serverInfos).forEach(server => {
        if(server.name != 'ansiblesrv') {
            inventory_stack.push(`${server.ip_address} ansible_ssh_private_key_file=~/.ssh/${server.private_key} ansible_user=${server.user}`);
        }
    });
    inventory_stack.push('[initialize:vars]');
    inventory_stack.push(`ansible_ssh_common_args='-o StrictHostKeyChecking=no'`)    
    inventory_stack.push('ansible_python_interpreter=python3');
    inventory_txt = inventory_stack.join("\n") + '\n\n\n';
    inventory_stack = [];

    //make each server own group
    Object.values(serverInfos).forEach(server => {
        inventory_stack.push(`[${server.name}]\n${server.ip_address} ansible_ssh_private_key_file=~/.ssh/${server.private_key}    ansible_user=${server.user}\n[${server.name}:vars]\nansible_ssh_common_args='-o StrictHostKeyChecking=no'\nansible_python_interpreter=python3`);
    });
    inventory_txt = inventory_txt + inventory_stack.join("\n") + '\n\n\n';

    let inventory_path = path.join(__dirname, "..", "cm", "inventory.ini");   
    fs.writeFileSync(inventory_path, inventory_txt, function(err) {
      if(err) throw err;
    });
}
