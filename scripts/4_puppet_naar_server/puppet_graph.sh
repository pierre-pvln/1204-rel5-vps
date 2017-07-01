#!/bin/bash
# Name:     puppet_grpah.sh
# Purpose:  A shell script to apply puppet files
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 09 - initial version
# 
# commandline:
# ./puppet_graph.sh
# ---------------------------------------------------

clear

# generate .dot files 
/opt/puppetlabs/bin/puppet apply /tmp/packer-puppet-masterless/manifests/vps_site.pp --modulepath=/tmp/packer-puppet-masterless/modules --graph --graphdir=/tmp/graphs --noop

# convert .dot to .png files
dot -Tpng /tmp/graphs/resources.dot -o /tmp/graphs/resources.png
dot -Tpng /tmp/graphs/relationships.dot -o /tmp/graphs/relationships.png
dot -Tpng /tmp/graphs/expanded_relationships.dot -o /tmp/graphs/expanded_relationships.png


