:: Name:     vbox_import.cmd
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
CALL folder-settings.cmd 
CALL vbox-settings.cmd
CD %parent%

:: Import the vm into virtualbox
%vboxm% import %packer_out_dir%\output-virtualbox-iso\%vps-hostname%.ovf

timeout /T 3
