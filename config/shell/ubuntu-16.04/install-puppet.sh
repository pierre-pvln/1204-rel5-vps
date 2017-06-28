#!/bin/bash
# Name:     install-puppet.sh
# Purpose:  Create a the Virtual Machine image including puppet provisioning
# Author:   pierre@pvln.nl
# Revision: 2016 03 30 - initial version
#			2017 02 08 - update for ubuntu 16.04

echo 'Installing Puppet'
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb
sudo apt-get update

apt-get -y install puppet-agent

echo 'Finished installing Puppet'
