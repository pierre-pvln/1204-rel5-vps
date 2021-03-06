#!/bin/bash
# Name:     puppet_stdlib.sh
# Purpose:  A shell script to validate puppet files
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 03 - initial version
#
# Inspiration: https://docs.puppet.com/puppet/latest/modules_installing.html#reference-puppet-module-actions
# 
# commandline:
# ./puppet_stdlib.sh
# ---------------------------------------------------

clear

/opt/puppetlabs/bin/puppet module install puppetlabs-stdlib --modulepath=/tmp/packer-puppet-masterless/modules

/opt/puppetlabs/bin/puppet module install puppetlabs-inifile --modulepath=/tmp/packer-puppet-masterless/modules
