#!/bin/bash
# Name:     puppet_validate.sh
# Purpose:  A shell script to validate puppet files
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 03 - initial version
# 
# commandline:
# ./puppet_validate.sh
# ---------------------------------------------------

clear

/opt/puppetlabs/bin/puppet parser validate /tmp/packer-puppet-masterless/manifests/vps_site.pp --modulepath=/tmp/packer-puppet-masterless/modules --debug --verbose
