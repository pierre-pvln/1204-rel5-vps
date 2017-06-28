# Name:     vps_site.pp
# Purpose:  Deploy applications and users on the Virtual Machine image
# Author:   pierre.veelen@pvln.nl
# Revision: 2016 04 03 - initial version
#           2016 04 11 - stages added
#           2016 04 14 - apache2 additional settings
#           2016 04 24 - configs class added 
#           2017 05 24 - stdlib included 
#                      - all_facts class added


node 'test-rel4-vps' {
  notice( "==== NODE: ${::hostname}" )
#  notice( "Operating system : ${::operatingsystem}" )
#  notice( "Hostname/Nodename: ${::hostname}" )
#  notice( '======================================' )

  # assign classes to run stages
  class {
    'configs':    stage => 'pre-stage'; # set basic configuration settings before installing packages
  }

  #load configuration settings
  include configs

  include apache2
  apache2::install {  $configs::vps_name:
    version_ensure => $configs::apache2_version_ensure,
  }

  apache2::vhost { $configs::vps_name:
    action => 'CREATE',         # create it
    domain => 'UNSET',          # domain name for the virtual host; UNSET defaults to $name(= value of $configs::vps_name)
    root   => 'UNSET',          # root directory for the virtual host; UNSET defaults to $name
  }

  apache2::vhost { '000-default':
    action => 'REMOVE',         # remove the default apache configuration settings
    domain => 'UNSET',          # domain name for the virtual host; UNSET defaults to $name(= value of $configs::vps_name)
    root   => '/var/www/html',  # root directory for the virtual host; UNSET defaults to $name
  }

  # install mysql software
  include mysql
  mysql::install { 'Joomla Database':
    version_ensure => $configs::mysql_version_ensure,
  }

  # create mysql database administrator users
  mysql::admin { $configs::mysql_main_user:
    action => 'CREATE',                   # create it
    pwtxt  => $configs::mysql_main_pw,    #
  }

  # create mysql database
  mysql::db { $configs::mysql_db_name:
    action     => 'CREATE',                   # create it
    db_user    => $configs::mysql_db_user,    #
    db_user_pw => $configs::mysql_db_user_pw, #
  }

  # load php5
  include php5
  php5::install { $configs::vps_name:
    version_ensure => $configs::php5_version_ensure,
  }

  include scripts
  scripts::dir { $configs::vps_name:
    script_dir => 'UNSET', # directory for the scripts; UNSET defaults to $name/scripts (= value of $configs::vps_name/scripts')
  }

  $script_files = [ 'info.php',
                    'get_server_info.php' ]

  scripts::file { $script_files:
    script_directory => $configs::vps_name,
  }

  
  #
  # Create users and their home directories
  #
  include users
  users::do { $configs::basic_users:
    action   => 'CREATE',                   # create users and their home directories
    usertype => 'BASIC',                    # should be basic users
  }

}

node default {
  notice( '==== DEFAULT =========================' )
}

#
# Non-node related settings
# 

#load the run stages settings for vps
include vps_stages
  
# assign classes to run stages
class {
  'common':     stage => 'pre-stage'; #load common settings
  'tree':       stage => 'pre-stage';
  'apt':        stage => 'pre-stage'; 
  }

#load common services
include common

#load tree command
include tree

#load generic applications
include apt
 