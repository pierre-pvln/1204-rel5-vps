:: Name:     vps_putty.cmd
:: Purpose:  Create a the Virtual Machine image
:: Author:   pierre.veelen@pvln.nl
:: Revision: 2016 09 25 - initial version
::

@ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET me=%~n0
:: Setting the name of the directory
SET parent=%~p0

:: GET SETTINGS
:: ============
cd ..
call vps-settings.cmd
cd %parent%

:: SERVERNAME NOT AVAIABLE YET; SO USE localhost
SET vps-hostname=localhost

:: -ssh     use SSH protocol
:: -pw      use password
:: -P 22222 use port 2222 (since it is NAT)
::
:: For test puposes
:: -v     show verbose messages

:: -ssh -P 2222 connects to NAT port 2222 -> 22 on server
::
"C:\_internet_download\35. Putty\putty" -ssh -P 2222 -pw the-admin the-admin@%vps-hostname%
