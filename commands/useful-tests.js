const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const sshSync = require('../lib/ssh');


exports.command = 'useful-tests';
exports.desc = 'Run the itrust testsuite ';
exports.builder = yargs => {
    yargs.option('count', {
            alias: 'c',
            describe: 'Run the test suite multiple times',
            type: 'int',
            default: 100
        });
};


exports.handler = async argv => {
    const { count } = argv;
    (async () => {
        await run( count );
    })();
};

async function run(count) {

    // the paths should be from root of cm directory
    // Transforming path of the files in host to the path in VM's shared folder
    console.log(chalk.blueBright(`Running iTrust testsuite ${count} times...`));
    let result = sshSync(`node /bakerx/cm/mutation-testing/mutation-testing.js  ${count}`, 'vagrant@192.168.33.20');
    if( result.error ) { process.exit( result.status ); }

}
