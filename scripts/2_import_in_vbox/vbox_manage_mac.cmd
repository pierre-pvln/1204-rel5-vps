:: Name:     vbox_manage_mac.cmd
:: Purpose:  start the vps in virtualbox
:: Author:   pierre.veelen@pvln.nl
:: Revision: 2016 09 23 - initial version

:: @ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET me=%~n0
:: Setting the name of the directory
SET parent=%~p0

SET vboxm="C:\Program Files\Oracle\VirtualBox\VBoxManage"

cd ..
call vps-settings.cmd
cd %parent%

:: remove the : from the MAC address
::
:: http://www.dostips.com/DtTipsStringManipulation.php
set vps-MAC_address_clean=%vps-MAC_address::=%

:: Modify the vm in virtualbox
%vboxm% modifyvm %vps-hostname% --macaddress2 %vps-MAC_address_clean%
%vboxm% modifyvm %vps-hostname% --nicpromisc2 allow-all

::timeout /T 10
pause
