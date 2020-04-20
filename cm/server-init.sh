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
    
    ansiblesrv_IP=$5
    ansiblesrv_ID=$6 

    echo "ansiblesrv_IP=${ansiblesrv_IP}" >> /etc/environment
    sudo cat /etc/environment

    echo "ansiblesrv_ID=${ansiblesrv_ID}" >> /etc/environment
    sudo cat /etc/environment   
    
    #replaces the first ip address in yml file
    sed -i "0,/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/ {s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$ansiblesrv_IP/}" ~/DEVOPS-12/test/inventory.yml

fi

if [ "$7" != "undefined" ]
  then
    
    jenkinssrv_IP=$7
    jenkinssrv_ID=$8

    echo "jenkinssrv_IP=${jenkinssrv_IP}" >> /etc/environment
    sudo cat /etc/environment

    echo "jenkinssrv_ID=${jenkinssrv_ID}" >> /etc/environment
    sudo cat /etc/environment

    # replace ip address with latest ip address for jenkins on ansible server
    sed -i "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$jenkinssrv_IP/g" ~/DEVOPS-12/cm/inventory.ini
    
    # replaces the second ip address in yml file
    sed -i "0,/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/! {s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$jenkinssrv_IP/}" ~/DEVOPS-12/test/inventory.yml
fi

sudo chmod 600 /etc/environment

# Script used to initialize your ansible server after provisioning.
sudo add-apt-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

# Ensure security key has proper permissions
chmod 700 ~/.ssh/js_rsa
