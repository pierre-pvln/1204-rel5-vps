#
# Lists the settings for initial deployment of users and their home directories
#
define users::do::list( $homedir='/home/',
                        $usertype='BASIC' ) {

  $username = downcase($name)
  $userpass = $username

  notice( '=============================' )
  notice( 'action  : LIST')
  notice( "user    : ${username}" )
  notice( "pwd     : ${userpass}" )
  notice( "homedir : ${homedir}${username}" )
  notice( "type    : ${usertype}" )
  notice( '=============================' )

}
