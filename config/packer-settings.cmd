:: Name:     packer-settings.cmd
:: Purpose:  setting folders configurations as an environment variable
:: Author:   pierre@pvln.nl
:: Revision: 2017 06 25 - initial version

:: PACKER COMMANDLINE SETTINGS
:: ===========================
:: https://www.packer.io/docs/commands/build.html
:: 
:: configure what to do when build fails
:: -on-error=cleanup (default)	: cleans up after the previous steps, deleting temporary files and virtual machines
:: -on-error=abort				: abort exits without any cleanup, which might require the next build to use -force
:: -on-error=ask 				: presents a prompt and waits for you to decide to clean up, abort, or retry the failed step.
SET on_build_fail=-on-error=ask


:: PACKER ENVIRONMENT SETTINGS
:: ===========================
:: https://www.packer.io/docs/other/environment-variables.html
::
:: Setting this to any value other than "" (empty string) or "0" will enable the logger
SET PACKER_LOG=1
::
:: The location of the log file. Note: PACKER_LOG must be set for any logging to occur.
SET PACKER_LOG_PATH=%log_dir%\debug-%me%-%dtStamp%.log
:: 
:: The location of the packer cache
SET PACKER_CACHE_DIR=C:\packer\local-cache\
