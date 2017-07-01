##!/bin/bash
# Name:     copie.sh
# Purpose:  A shell script copy the get_server_ifo.php file to the webserver without using puppet
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 05 01 - initial version
# 
# commandline:
# ./copie.sh
# ---------------------------------------------------

sudo  -E cp ./packer-puppet-masterless/modules/scripts/files/get_server_info.php /var/www/voluntas.nl.local/scripts
