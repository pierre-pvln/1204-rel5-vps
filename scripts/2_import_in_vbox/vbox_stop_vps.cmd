:: Name:     vbox_stop_vps.cmd
:: Purpose:  import vps in virtualbox
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
			   
:: Stop the VPS
%vboxm% controlvm %vps-hostname% acpipowerbutton  

timeout /T 3
