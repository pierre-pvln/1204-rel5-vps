:: Name:     check-vps.cmd
:: Purpose:  Check the packer configuration files for the vps
:: Author:   pierre@pvln.nl
:: Revision: 2016 09 23 - initial version
::           2017 03 01 - vps version added
::           2017 06 01 - extra tekst laten zien die aangeeft welke bestanden getest worden
::           2017 06 23 - folders changed

@ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET me=%~n0
:: Setting the name of the directory
SET parent=%~p0
:: Setting the directory and drive of this commandfile
SET cmd_dir=%~dp0

:: STATIC VARIABLES
:: ================
cd ..\..\config
call folder-settings.cmd
call vps-settings.cmd
cd "%cmd_dir%" 

ECHO.
ECHO %me%: **************************************
ECHO %me%: RUNNING PACKER INSPECT VPS
ECHO %me%: ON FILE: %packer_cfg_dir%\default-user.json
ECHO.
c:\packer\packer inspect %packer_cfg_dir%\default-user.json

IF "%configure_with_puppet%"=="yes" (
	ECHO.
	ECHO %me%: **************************************
	ECHO %me%: RUNNING PACKER VALIDATE VPS
	ECHO %me%: ON FILE: %packer_cfg_dir%\vps-puppet-%vps-osversion%.json
	ECHO.	
	c:\packer\packer validate -var-file=%packer_cfg_dir%\default-user.json %packer_cfg_dir%\vps-puppet-%vps-osversion%.json
	ECHO.
	ECHO %me%: **************************************
	ECHO %me%: RUNNING PACKER INSPECT VPS
	ECHO %me%: ON FILE: %packer_cfg_dir%\vps-puppet-%vps-osversion%.json	
	ECHO.
	c:\packer\packer inspect %packer_cfg_dir%\vps-puppet-%vps-osversion%.json
) ELSE (
	ECHO.
	ECHO %me%: **************************************
	ECHO %me%: RUNNING PACKER VALIDATE VPS
	ECHO %me%: ON FILE: %packer_cfg_dir%\vps-only-%vps-osversion%.json
	ECHO.
	c:\packer\packer validate -var-file=%packer_cfg_dir%\default-user.json %packer_cfg_dir%\vps-only-%vps-osversion%.json
	ECHO.
	ECHO %me%: **************************************
	ECHO %me%: RUNNING PACKER INSPECT VPS
	ECHO %me%: ON FILE: %packer_cfg_dir%\vps-only-%vps-osversion%.json
	ECHO.
	c:\packer\packer inspect %packer_cfg_dir%\vps-only-%vps-osversion%.json
) 

pause