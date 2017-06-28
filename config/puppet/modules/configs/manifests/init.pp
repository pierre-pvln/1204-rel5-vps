# == Class: configs
#
# The settings for the vps.
#
class configs {

  $vps_name=$trusted['certname']

  # Versions needed
  #$apache2_version_ensure  = '2.4.7-1ubuntu4.9'
  #$mysql_version_ensure    = '5.5.49-0ubuntu0.14.04.1'
  #$php5_version_ensure     = '5.5.9+dfsg-1ubuntu4.16'


  # webserver
  $apache2_version_ensure  = 'latest'

  # database
  $mysql_version_ensure    = 'latest'

  $mysql_main_user         = 'root'
  $mysql_main_pw           = $mysql_main_user

  $mysql_db_name           = 'joomla_db'

  $mysql_db_user           = 'joomla'
  $mysql_db_user_pw        = $mysql_db_user


  # php
  $php5_version_ensure     = '5.5.9+dfsg-1ubuntu4.21'

  #users
  $basic_users = [ 'Joomla', 'Dummy' ] # define the usernames to use as basic users
  
}
