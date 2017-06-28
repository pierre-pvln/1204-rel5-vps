#!/bin/bash
# Name:     puppet_apply.sh
# Purpose:  A shell script to apply puppet files
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 03 - initial version
# 
# commandline:
# ./puppet_apply.sh
# ---------------------------------------------------

clear

# Ubuntu requires -E (preserve environment) option in Ubuntu
sudo -E /opt/puppetlabs/bin/puppet apply /tmp/packer-puppet-masterless/manifests/vps_site.pp --modulepath=/tmp/packer-puppet-masterless/modules
