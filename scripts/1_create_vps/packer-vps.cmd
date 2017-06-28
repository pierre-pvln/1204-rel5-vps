:: Name:     packer-vps.cmd
:: Purpose:  Create a the Virtual Machine image without additional provisioning by puppet
:: Author:   pierre@pvln.nl
:: Revision: 2016 03 26 - initial version
::           2016 09 22 - versioning added  
::           2017 02 18 - vps-os version added 
::           2017 03 03 - adding what to do when build fails
::                      - copying preseed files to webserver
::           2017 06 23 - copying preseed files to webserver removed
::                      - change folders
::                      - caching folder packer added

@ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of this script
SET me=%~n0
:: Setting the name of the directory with this script
SET parent=%~p0
:: Setting the drive of this commandfile
SET drive=%~d0
:: Setting the directory and drive of this commandfile
SET cmd_dir=%~dp0

:: STATIC VARIABLES
:: ================
cd ..\..\config
call datestamp.cmd
call folder-settings.cmd
call packer-settings.cmd
call puppet-settings.cmd
call vps-settings.cmd
cd "%cmd_dir%" 

:: LOGGING SETTINGS
:: ================
:: SET logging_to_file=yes 
SET logging_to_file=no

:: CREATE COMMANDLINE
:: ==================
::
IF "%configure_with_puppet%"=="yes" (
	SET run_command=c:\packer\packer build -force %on_build_fail% -var-file=%packer_cfg_dir%\default-user.json %packer_cfg_dir%\vps-puppet-%vps-osversion%.json 
	SET txt_command=running packer with %packer_cfg_dir%\vps-puppet-%vps-osversion%.json
	SET vps-output_dir=%packer_out_dir%\vps_puppet_config_%dtStamp%\
) ELSE (
	SET run_command=c:\packer\packer build -force %on_build_fail% -var-file=%packer_cfg_dir%\default-user.json %packer_cfg_dir%\vps-only-%vps-osversion%.json 
	SET txt_command=running packer with %packer_cfg_dir%\vps-only-%vps-osversion%.json
	SET vps-output_dir=%packer_out_dir%\vps_no-puppet_config_%dtStamp%\
)

ECHO.
ECHO %me%: **************************************
ECHO %me%: %DATE% %TIME%
ECHO %me%: START: %txt_command%
ECHO %me%: **************************************
ECHO.

:: ======================
:: START OF THE REAL CODE
:: ======================
:: Send output to logfile (or not)
IF "%logging_to_file%"=="yes" (
	:: check if logging directory exists
	IF NOT EXIST "%log_dir%" (md "%log_dir%")
	IF EXIST "%log_dir%\%me%.log.older" (del "%log_dir%\%me%.log.older")
	IF EXIST "%log_dir%\%me%.log" (rename "%log_dir%\%me%.log" "%me%.log.older" )
    ECHO %me%: %DATE% %TIME% >>"%log_dir%\%me%.log"
	ECHO %me%: Running command >>"%log_dir%\%me%.log"
	ECHO %me%: %run_command% >>"%log_dir%\%me%.log"
	%run_command% >>"%log_dir%\%me%.log"

) ELSE (
    %run_command%
) 

ECHO.
ECHO %me%: **************************************
ECHO %me%: %DATE% %TIME%
ECHO %me%: DONE: %txt_command%
ECHO %me%: **************************************
ECHO.
ECHO on

::
:: Copy outputfile to default directory
::
IF NOT EXIST "%packer_out_dir%\output-virtualbox-iso" (md "%packer_out_dir%\output-virtualbox-iso")
COPY /Y /V "%vps-output_dir%\*.*" "%packer_out_dir%\output-virtualbox-iso"

timeout /T 5

pause