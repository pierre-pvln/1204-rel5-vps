#!/bin/bash
# Name: 	naar_webserver.sh
# Purpose:  A shell script to copy back-up of website and installer to website directory 
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 17 - initial version
# 
# commandline:
# ./naar_webserver.sh
# ---------------------------------------------------

clear

sudo cp -u /tmp/live-site-backup/* /var/www/labyrint-rel4-vps.local

sudo chown www-data:www-data /var/www/labyrint-rel4-vps.local/*
