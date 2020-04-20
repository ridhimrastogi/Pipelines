#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

# Print error message and exit with error code 1
function die {
    echo "$1"
    exit 1
}

# Check the number of arguments
[ $# -ge 1 ] || die "usage: $0 node mutation-testing.js <count>"

FILEPATH=$1
COUNT=$2

sudo chown vagrant:vagrant -R /var/lib/jenkins/workspace/iTrust
cd ~/DEVOPS-12/cm/mutation-testing/ && npm install
node $FILEPATH $COUNT
sudo chown jenkins:jenkins -R /var/lib/jenkins/workspace/iTrust