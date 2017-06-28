#
# removes users and their home directories
#
define users::do::remove( $homedir='/home/',
                          $usertype='BASIC' ) {

  $username = downcase($name)
  $userpass = $username

  notice( '=============================' )
  notice( 'action  : REMOVE')
  notice( "user    : ${username}" )
  notice( "homedir : ${homedir}${username}" )
  notice( "type    : ${usertype}" )
  notice( '=============================' )

  user { $username:
    ensure     => absent,
  }

####
#### REMOVING USER DIRECTORY DOES NOT WORK YET
####
#  # removing home directory for user
#  file { "${homedir}${username}":
#    ensure => absent,
#  }

}
