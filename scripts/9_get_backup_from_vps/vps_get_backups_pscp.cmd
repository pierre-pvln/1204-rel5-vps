:: Name:     vps_graphs_pscp.cmd
:: Purpose:  Create a the Virtual Machine image
:: Author:   pierre.veelen@pvln.nl
:: Revision: 2016 04 10 - initial version
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
:: SET vps-hostname=localhost

:: Transfer files
:: -scp   use SCP protocol
:: -pw    use password
::
:: For test puposes
:: -v     show verbose messages

:: Transfer puppet graph files
"C:\_internet_download\35. Putty\pscp" -scp -P 22 -pw the-admin the-admin@%vps-hostname%:/var/www/labyrint-rel4-vps.local/administrator/components/com_akeeba/backup/site-labyrint-therapie.nl.local-20170507-102852.jpa ..\retrieved-backups\


timeout /T 20