:: Name:     edit_hosts.bat
:: Purpose:  Edit the windows hosts file
:: Author:   pierre.veelen@pvln.nl
:: Revision: 2016 04 17 - initial version
::

@ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET me=%~n0
:: Setting the name of the directory
SET parent=%~dp0

:: STATIC VARIABLES
:: ================
:: -COMMAND
SET run_command="c:\program files (x86)\notepad++\notepad++" C:\Windows\System32\drivers\etc\hosts
SET txt_command=Editing C:\Windows\System32\drivers\etc\hosts

ECHO.
ECHO %me%: **************************************
ECHO %me%: %DATE% %TIME%
ECHO %me%: START: %txt_command%
ECHO %me%: **************************************
ECHO.

:: ======================
:: START OF THE REAL CODE
:: ======================

::set datetimef=%date:~3,10%_%time:~0,2%-%time:~3,2%-%time:~6,2%
::set datetimef=%datetimef: =0%

SET datetimef=%DATE:~9,4%-%DATE:~6,2%-%DATE:~3,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
SET datetimef=%datetimef: =0%

COPY /A C:\Windows\System32\drivers\etc\hosts C:\Windows\System32\drivers\etc\hosts-%datetimef% /A

%run_command%
	
ECHO.
ECHO %me%: **************************************
ECHO %me%: %DATE% %TIME%
ECHO %me%: DONE: %txt_command%
ECHO %me%: **************************************
ECHO.
ECHO on

timeout /T 3
