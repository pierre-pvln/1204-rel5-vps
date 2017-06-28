# list the database administrave user
define mysql::admin::list($pwtxt='dummy') {

  # show used settings
  notice( '=============================' )
  notice( 'action    : LIST')
  notice( "user      : ${name}" )
  notice( "password  : ${pwtxt}" )
  notice( '=============================' )

}
