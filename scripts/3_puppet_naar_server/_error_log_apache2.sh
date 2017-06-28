#!/bin/bash
# Name:     error_log_apache2.sh
# Purpose:  A shell script to list the apache2 error logfile
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 30 - initial version
# 
# commandline:
# ./error_log_apache2.sh
# ---------------------------------------------------

clear

#tail /var/log/apache2/voluntas.nl.local-error_log
cat /var/log/apache2/voluntas.nl.local-error_log

