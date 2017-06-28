#
# Performs initial deployment of users and their home directories
#
define users::do::create( $homedir='/home/',
                          $usertype='BASIC' ) {

  $username = downcase($name)
  $userpass = $username

  notice( '=============================' )
  notice( 'action  : CREATE')
  notice( "user    : ${username}" )
  notice( "pwd     : ${userpass}" )
  notice( "homedir : ${homedir}${username}" )
  notice( "type    : ${usertype}" )
  notice( '=============================' )

  user { $username:
    ensure     => present,
    comment    => "${username} user",
    home       => "${homedir}${username}",
    managehome => true,
    shell      => '/bin/bash',
    password   => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${userpass} | tr -d '\n'"),
    #
    # more info: http://stackoverflow.com/questions/23253271/not-updating-the-user-password
    #
  }

  # creating home directory for user
  file { "${homedir}${username}":
    ensure => directory,
    owner  => $username,
    group  => $username,
    mode   => '0775',
  }
}
