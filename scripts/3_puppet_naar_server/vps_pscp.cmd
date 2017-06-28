:: Name:     vps_pscp.cmd
:: Purpose:  Create a the Virtual Machine image
:: Author:   pierre.veelen@pvln.nl
:: Revision: 2016 04 01 - initial version
::           2017 05 24 - comments added
::                      - check added if file with vps-settings exists
::                      - check added if host is reachable
::

@ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET me=%~n0
:: Setting the name of the directory
SET parent=%~p0
:: Setting for Error messages
SET error_message=errorfree

:: GET SETTINGS
:: ============
cd ..
IF EXIST vps-settings.cmd (
   call vps-settings.cmd
) ELSE (
   SET error_message=File with VPS settings doesn't exist
)
cd %parent%
IF %error_message% NEQ errorfree GOTO ERROR_EXIT

:: Check if VPS server is available based on vps-hostname
::
:: A successful PING does NOT always return an %errorlevel% of 0
:: Therefore to reliably detect a successful ping - pipe the output into FIND and look for the text "TTL" 
:: https://ss64.com/nt/ping.html
:: Also use ping over IP v4; default ping not always returns a TTL in the response.

PING -4 -n 1 %vps-hostname% |find "TTL=" && GOTO DO_SOMETHING
SET error_message=%vps-hostname% not available on vps-hostname
SET vps-hostname=localhost

:DO_SOMETHING
ECHO *******************
ECHO %vps-hostname%
ECHO *******************
:: THE ACTUAL THING TO DO
:: ======================
:: Transfer files
:: -scp     use SCP protocol
:: -r       copy directories recursively
:: -pw      use password
:: -P 2222  use port 2222 (since it is NAT)
::
:: For test puposes
:: -v     show verbose messages

:: Transfer puppet files
"C:\_internet_download\35. Putty\pscp" -scp -P 2222 -r -pw the-admin ../puppet/ the-admin@%vps-hostname%:/tmp/packer-puppet-masterless/

:: Transfer puppet script files
"C:\_internet_download\35. Putty\pscp" -scp -P 2222 -pw the-admin *.sh the-admin@%vps-hostname%:/tmp

ECHO.
ECHO *******************
ECHO:
ECHO Ga naar directory /tmp
ECHO:
ECHO Niet vergeten op de server het commando
ECHO chmod +x *.sh
ECHO geven. Anders kunnen de scripts niet lopen
ECHO:
ECHO En ook niet vergeten ./puppet_stdlib.sh te runnen. 
ECHO Anders ontbreken enkele puppet modules.
ECHO:
ECHO *******************
GOTO CLEAN_EXIT

:ERROR_EXIT
ECHO *******************
ECHO %error_message%
ECHO *******************
   
:CLEAN_EXIT   
timeout /T 3
