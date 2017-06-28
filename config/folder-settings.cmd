:: Name:     folder-settings.cmd
:: Purpose:  setting folders configurations as an environment variable
:: Author:   pierre@pvln.nl
:: Revision: 2017 06 25 - initial version

:: IMPORTANT
:: =========
:: - Do not end folders with \
::


:: Setting folder with packer json configuration files
:: 
SET packer_cfg_dir=..\..\config\packer

:: Setting folder for packer output file (VM and disk)
::
SET packer_out_dir=..\..\output

:: Setting folder for the generic log directory
::
SET log_dir=..\..\logging

:: Setting for for config in packer json files
::
SET cfg_dir=../../config