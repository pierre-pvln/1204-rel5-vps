:: Name:     vps-settings.cmd
:: Purpose:  setting basic configuration items of the VPS as an environment variable
:: Author:   pierre@pvln.nl
:: Revision: 2016 09 22 - initial version
::           2016 09 23 - vps-name based on current folder name  
::           2016 09 25 - adding .local at the end of the vps-hostname
::			 2017 03 01 - adding MAC address
::			 2017 03 03 - adding what to do when build fails
::           2017 03 05 - adding netwerk mode for server 
::           2017 03 13 - timestamp added in vps description text
::           2017 06 23 - folder structure changed
::           2017 06 25 - packer and puppet settings placed in seperate files

:: -VERSION
:: ========
SET vps-version=v1.0.9

:: -VPS-HOSTNAME
:: ============= 
:: The hostname of the server on the virtual machine
:: This is the name of the directory/folder ending with .local
:: http://superuser.com/questions/160702/get-current-folder-name-by-a-dos-command
:: get current folder name
set from_dir=%~p0
cd ..
for /f "delims=\" %%a in ("%cd%") do SET vps-hostname=%%~nxa
cd "%from_dir%"

:: add .local to vps-hostname
SET vps-hostname=%vps-hostname%.local

:: -MULTIDOMAIN
:: ============
:: Wether or not the server hosts multi domains and therefore requires a second ethernet adapter in bridge mode
:: (For example when using Joomla! and Virtual Domain extension
:: Values: nat    -> only use the NAT interface (default)
::         bridge -> use a second network interface and set it in bridgemode (for multidomain support)
SET vps-mode=bridge

:: !! Important !!
:: ===============
:: The below settings require that the MAC Adress - IP Address relationship is set in the DHCP server. 
:: configure the servers MAC address; this enables DHCP server giving predefined IP Address
SET vps-MAC_address=08:00:27:A4:A1:16

:: remove the : from the MAC address
::
:: http://www.dostips.com/DtTipsStringManipulation.php
set vps-MAC_address_clean=%vps-MAC_address::=%

:: -OSNAME
:: =======
:: Operating system to be installed on this virtual machine
:: Values: ubuntu -> installs Ubuntu
SET vps-osname=ubuntu

:: -OSVERSION
:: ==========
:: Operating system version to be installed on this virtual machine
:: Values: 12.04 -> Ubuntu 12.04
::         14.04 -> Ubuntu 14.04 
::         16.04 -> Ubuntu 16.04
SET vps-osversion=12.04

