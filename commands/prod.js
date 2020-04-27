const fs = require('fs');
const path = require('path');
const chalk = require('chalk');
const provision = require('../lib/provision');

const scpSync = require('../lib/scp');
const sshSync = require('../lib/ssh');


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
        let requiredServers =[{serverName: 'monitor', slug: '512mb' },{serverName: 'checkbox', slug: '512mb' },{serverName: 'itrust', slug: 's-2vcpu-4gb' }];
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

        await new Promise(r => setTimeout(r, 50000)); //give servers time to boot

        configureMonitor();  //configure the Monitor server
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
    let inventory_stack = [];

    //add monitor-push groput
    let server = serverInfos['monitor'];
    inventory_stack.push(`[monnitorpush]\n${server.ip_address} ansible_ssh_private_key_file=~/.ssh/${server.private_key}    ansible_user=${server.user}\n[monnitorpush:vars]\nansible_ssh_common_args='-o StrictHostKeyChecking=no'\nansible_python_interpreter=python3`);


    //make each server own group
    Object.values(serverInfos).forEach(server => {
        inventory_stack.push(`[${server.name}]\n${server.ip_address} ansible_ssh_private_key_file=~/.ssh/${server.private_key}    ansible_user=${server.user}\n[${server.name}:vars]\nansible_ssh_common_args='-o StrictHostKeyChecking=no'\nansible_python_interpreter=python3`);
    });

    inventory_txt = inventory_stack.join("\n") + '\n\n\n';

    let inventory_path = path.join(__dirname, "..", "cm", "deploy-inventory.ini");
    fs.writeFileSync(inventory_path, inventory_txt, function(err) {
      if(err) throw err;
    });
}

function configureMonitor(){
    let filePath =  '/bakerx/' + 'cm/playbook.yml';
    let inventory_path = '/bakerx/cm/deploy-inventory.ini';
    console.log(chalk.blueBright(`Congifuring the monitor server`));
    let result = sshSync(`/bakerx/cm/deploy/deploy-monitor.sh ${filePath} ${inventory_path}`, 'vagrant@192.168.33.10');
    if (result.error) {
        process.exit(result.status);
    }
}
