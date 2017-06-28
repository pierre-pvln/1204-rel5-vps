#!/bin/bash
# Name:     install_puppet-lint.sh
# Purpose:  A shell script to install puppet-lint
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 06 - initial version
# 
# commandline:
# ./install_puppet-lint.sh
# ---------------------------------------------------

clear

# install rubygems on ububtu 12
#sudo apt-get install rubygems

# install rubygems on ububtu 14.04
sudo apt-get -y install rubygems-integration

# install puppet-lint
sudo gem install puppet-lint

