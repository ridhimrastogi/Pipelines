const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const sshSync = require('../lib/ssh');


exports.command = 'deploy <project>';
exports.desc = 'Deploy the given project';
exports.builder = yargs => {
    yargs.options({});
};


exports.handler = async argv => {
    const {
        project
    } = argv;

    (async () => {

        await run(project);

    })();

};

async function run(project) {

    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    if (project == 'checkbox.io') {
        let filePath = '~/DEVOPS-12/cm/Jenkins_Builds/checkbox/checkbox.yaml';
        let inventorypath = '~/DEVOPS-12/cm/jenkins_jobs.ini';
        console.log(chalk.blueBright(`Deploying ${project}...`));
        let result = sshSync(`~/DEVOPS-12/cm/Jenkins_Builds/checkbox/build-checkbox.sh ${filePath} ${inventorypath}`, `root@${process.env.jenkinssrv_IP}`);
        if (result.error) {
            process.exit(result.status);
        }
    } else if (project == 'iTrust') {
        console.log(project);

        let ip = getIPAddress();
        console.log(chalk.greenBright(`Setting host network as ${ip}...`));
        fs.writeFileSync(path.join(__dirname, "../cm/deploy/ip.txt"), ip);

        // result = scpSync(`/bakerx/cm/deploy/ip.txt`, 'vagrant@192.168.33.20:/home/jenkins/ip.txt');
        // if (result.error) {
        //     process.exit(result.status);
        // }

        let filePath = '/bakerx/cm/Jenkins_Builds/iTrust/iTrust.yaml';
        let inventorypath = '/bakerx/cm/jenkins_jobs.ini';
        console.log(chalk.blueBright(`Building ${project}...`));
        result = sshSync(`/bakerx/cm/Jenkins_Builds/iTrust/build-iTrust.sh ${filePath} ${inventorypath}`, 'vagrant@192.168.33.20');
        if (result.error) {
            process.exit(result.status);
        }

        // let result = scpSync(`/bakerx/cm/Jenkins_Builds/iTrust/build-iTrust.sh ${filePath} ${inventorypath}`, 'vagrant@192.168.33.20');
        // if (result.error) { process.exit(result.status);

    } else {
        console.log("Not yet supported. Try again with checkbox.io or iTrust --gh-user --gh-password")
    }

}

function getIPAddress() {
    var interfaces = require('os').networkInterfaces();
    for (var devName in interfaces) {
        var iface = interfaces[devName];

        for (var i = 0; i < iface.length; i++) {
            var alias = iface[i];
            if (alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal)
                return alias.address;
        }
    }

    return '0.0.0.0';
}