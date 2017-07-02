:: Name:     vps_pscp.cmd
:: Purpose:  Create a the Virtual Machine image
:: Author:   pierre.veelen@pvln.nl
:: Revision: 2016 04 01 - initial version
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

:: Transfer files
:: -scp     use SCP protocol
:: -r       copy directories recursively
:: -pw      use password
:: -P 22222 use port 2222 (since it is NAT)
::
:: For test puposes
:: -v     show verbose messages

:: Transfer puppet files
"C:\_internet_download\35. Putty\pscp" -scp -P 2222 -r -pw the-admin ../live-site-backup the-admin@%vps-hostname%:/tmp

:: Transfer puppet script files
"C:\_internet_download\35. Putty\pscp" -scp -P 2222 -pw the-admin *.sh the-admin@%vps-hostname%:/tmp


ECHO.
ECHO *******************
ECHO.
ECHO Ga naar directory /tmp
ECHO.
ECHO Niet vergeten op de server het commando
ECHO chmod +x *.sh
ECHO geven. Anders kunnen de scripts niet lopen
ECHO.
ECHO *******************

timeout /T 3
