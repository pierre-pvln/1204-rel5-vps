#!/bin/bash
# Name:     puppet_noop.sh
# Purpose:  A shell script to validate puppet files
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 03 - initial version
# 
# commandline:
# ./puppet_noop.sh
# ---------------------------------------------------

clear

/opt/puppetlabs/bin/puppet apply /tmp/packer-puppet-masterless/manifests/vps_site.pp --modulepath=/tmp/packer-puppet-masterless/modules --noop
