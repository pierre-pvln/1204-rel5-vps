#!/bin/bash
# Name:     install-puppet.sh
# Purpose:  Create a the Virtual Machine image including puppet provisioning
# Author:   pierre@pvln.nl
# Revision: 2016 03 30 - initial version

echo 'Installing Puppet'

# get the puppet installer file
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
# install the package
dpkg -i puppetlabs-release-pc1-trusty.deb
# delete the puppet installer file
rm puppetlabs-release-pc1-trusty.deb

apt-get update
# install puppet agent
apt-get -y install puppet-agent

echo 'Finished installing Puppet'
