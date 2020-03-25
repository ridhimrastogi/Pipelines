#!/bin/bash

# Exit on error
set -e

# Trace commands as we run them:
set -x

GH_USER=$1
GH_PWD=$2
echo $2

# Script used to initialize your ansible server after provisioning.
sudo add-apt-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

# Ensure security key has proper permissions
chmod 700 ~/.ssh/js_rsa

sudo chmod 666 /etc/environment

echo "GH_USER=${GH_USER}" >> /etc/environment
sudo cat /etc/environment

echo "GH_PWD=${GH_PWD}" >> /etc/environment
sudo cat /etc/environment

sudo chmod 600 /etc/environment

