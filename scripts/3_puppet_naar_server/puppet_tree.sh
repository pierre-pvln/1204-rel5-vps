#!/bin/bash
# Name: 	puppet_tree.sh
# Purpose:  A shell script to show the puppet modules and manifests tree
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 03 - initial version
# 
# commandline:
# ./puppet_tree.sh
# ---------------------------------------------------

clear

sudo -E tree /tmp/packer-puppet-masterless
