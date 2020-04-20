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

JOB=$1
INVENTORY=$2

sudo cp $INVENTORY /etc/jenkins_jobs/.
jenkins-jobs update $JOB
curl -X POST -u admin:admin http://${jenkinssrv_IP}/job/checkbox.io/build
sleep 10
echo "\n"
for (( ; ; ))
do
    OUT=$(curl -s "http://${jenkinssrv_IP}:9000/job/checkbox.io/lastBuild/api/json" | jq -r '.building')
    if $OUT; then sleep 20; else break; fi
done
curl -s http://${jenkinssrv_IP}/job/checkbox.io/lastBuild/consoleText
