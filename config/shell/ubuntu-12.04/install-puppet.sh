#!/bin/bash
# Name:     install-puppet.sh
# Purpose:  Create a the Virtual Machine image including puppet provisioning
# Author:   pierre@pvln.nl
# Revision: 2017 06 02 - initial version

echo 'Installing Puppet'

# get the puppet installer file
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
# install the package
sudo dpkg -i puppetlabs-release-precise.deb
# delete the puppet installer file
rm puppetlabs-release-precise.deb

apt-get update
# install puppet agent
apt-get -y install puppet

echo 'Finished installing Puppet'
