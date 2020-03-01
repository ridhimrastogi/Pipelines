const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const sshSync = require('../lib/ssh');


exports.command = 'build <project>';
exports.desc = 'Build the given project';
exports.builder = yargs => {
    yargs.options({
    });
};


exports.handler = async argv => {
    const { project } = argv;

    (async () => {

        await run( project );

    })();

};

async function run(project) {

    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    if( project == 'checkbox.io'){
        let filePath = '/bakerx/cm/checkbox.yaml';
    let inventorypath = '/bakerx/cm/jenkins_jobs.ini'
    console.log(chalk.blueBright(`Building ${project}...`));
    let result = sshSync(`/bakerx/cm/build-checkbox.sh ${filePath} ${inventorypath}`, 'vagrant@192.168.33.20');
    if( result.error ) { process.exit( result.status ); }
    } else {
        console.log("Not yet supported. Try again with checkbox.io")
    }



}
