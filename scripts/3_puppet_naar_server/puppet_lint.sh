#!/bin/bash
# Name:     puppet_lint.sh
# Purpose:  A shell script to validate puppet files conform to official style guides
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 06 - initial version
# 
# commandline:
# ./puppet_lint.sh
# ---------------------------------------------------

clear

find -name '*.pp' | xargs -n 1 -t puppet-lint --no-80chars-check

