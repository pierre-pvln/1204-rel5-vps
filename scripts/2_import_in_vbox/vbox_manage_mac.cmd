:: Name:     vbox_manage_mac.cmd
:: Purpose:  start the vps in virtualbox
:: Author:   pierre@pvln.nl
:: Revision: 2016 09 23 - initial version
::           2017 07 01 - new folder structure

@ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET me=%~n0
:: Setting the name of the directory
SET parent=%~p0

CD ..\..\config
CALL vps-settings.cmd
CALL vbox-settings.cmd
CD %parent%

:: Modify the vm in virtualbox
%vboxm% modifyvm %vps-hostname% --macaddress2 %vps-MAC_address_clean%
%vboxm% modifyvm %vps-hostname% --nicpromisc2 allow-all

::timeout /T 3
