:: Name:     folder-settings.cmd
:: Purpose:  setting folders configurations as an environment variable
:: Author:   pierre@pvln.nl
:: Revision: 2017 06 25 - initial version

:: IMPORTANT
:: =========
:: - Do not end folders with \ or /
:: - sometimes \ is used and sometimes /

:: 
:: GENERIC
:: =======
::
:: Setting folder for the generic log directory
::
SET log_dir=..\..\logging
::
:: ???????? WHERE IS THIS USED ???????
::
SET cfg_dir=../../config

:: 
:: PACKER
:: ======
::
:: Setting folder with packer json configuration files
:: 
SET packer_cfg_dir=..\..\config\packer
::
:: Setting folder for packer output file (VM and disk)
::
SET packer_out_dir=..\..\output

:: 
:: PUPPET
:: ======
::
:: Setting folder with puppet config and manifest files
:: 
SET puppet_cfg_dir=../../config/puppet
::
:: Setting folder where puppet graphs are stored after download
:: 
SET puppet_grf_dir=..\..\graphs
::
:: Setting folder where puppet config from VPS are stored after download
:: 
SET puppet_rtr_dir=..\..\retrieved-puppet
