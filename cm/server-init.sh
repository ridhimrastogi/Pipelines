#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

GH_USER=$1
GH_PWD=$2


sudo chmod 666 /etc/environment

echo "GH_USER=${GH_USER}" >> /etc/environment
sudo cat /etc/environment

echo "GH_PWD=${GH_PWD}" >> /etc/environment
sudo cat /etc/environment




if [ "$3" != "undefined" ]
  then
    
    GM_USER=$3
    GM_PWD=$4    

    echo "GM_USER=${GM_USER}" >> /etc/environment
    sudo cat /etc/environment

    echo "GM_PWD=${GM_PWD}" >> /etc/environment
    sudo cat /etc/environment
fi

if [ "$5" != "undefined" ]
  then
    
    jenkinssrv_IP$5
    jenkinssrv_ID$6 

    echo "jenkinssrv_IP=${jenkinssrv_IP}" >> /etc/environment
    sudo cat /etc/environment

    echo "jenkinssrv_ID=${jenkinssrv_ID}" >> /etc/environment
    sudo cat /etc/environment
fi

sudo chmod 600 /etc/environment

# Script used to initialize your ansible server after provisioning.
sudo add-apt-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

# Ensure security key has proper permissions
chmod 700 ~/.ssh/js_rsa
