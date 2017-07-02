:: Name:     datestamp.cmd
:: Purpose:  create a datestamp as an environment variable
:: Author:   pierre@pvln.nl
:: Revision: 2017 06 25 - initial version

:: DATESTAMP
:: Sets the proper date and time stamp with 24Hr Time for log file naming convention
:: source http://stackoverflow.com/questions/1192476/format-date-and-time-in-a-windows-batch-script
::
SET HOUR=%time:~0,2%
SET dtStamp9=%date:~9,4%%date:~6,2%%date:~3,2%_0%time:~1,1%%time:~3,2%%time:~6,2% 
SET dtStamp24=%date:~9,4%%date:~6,2%%date:~3,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

:: Remove any spaces in datestamp
:: source http://www.dostips.com/DtTipsStringManipulation.php
::
SET dtStamp=%dtStamp: =%
