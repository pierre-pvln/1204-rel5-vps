:: Name:     vps_graphs_pscp.cmd
:: Purpose:  Create a the Virtual Machine image
:: Author:   pierre.veelen@pvln.nl
:: Revision: 2016 04 10 - initial version
::           2017 05 24 - comments added
::                      - check added if file with vps-settings exists
::                      - check added if host is reachable
::           2017 07 01 - new folder structure
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
call folder-settings.cmd
call pscp-settings.cmd
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
ECHO Connected: %vps-hostname%
ECHO *******************
:: THE ACTUAL THING TO DO
:: ======================
:: Transfer files
:: -scp   use SCP protocol
:: -pw    use password
::
:: For test puposes
:: -v     show verbose messages

:: Transfer puppet graph files
%_pscp% -scp -P 2222 -pw the-admin the-admin@%vps-hostname%:/tmp/graphs/resources.png %puppet_grf_dir%\resources.png

%-pscp% -scp -P 2222 -pw the-admin the-admin@%vps-hostname%:/tmp/graphs/relationships.png %puppet_grf_dir%\relationships.png

%_pscp% -scp -P 2222 -pw the-admin the-admin@%vps-hostname%:/tmp/graphs/expanded_relationships.png %puppet_grf_dir%\expanded_relationships.png

GOTO CLEAN_EXIT

:ERROR_EXIT
ECHO *******************
ECHO Error: %error_message%
ECHO *******************
   
:CLEAN_EXIT   
timeout /T 3