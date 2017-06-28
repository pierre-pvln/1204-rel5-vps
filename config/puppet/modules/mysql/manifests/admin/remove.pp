# remove the database administrator user
define mysql::admin::remove($pwtxt='dummy') {

  # show used settings
  notice( '=============================' )
  notice( 'action   : REMOVE')
  notice( "user     : ${name}" )
  notice( "password : ${pwtxt}" )
  notice( '=============================' )

  # mysqladmin is a client for performing administrative operations.
  # You can use it to check the server's configuration and current status, to create and drop databases, and more.
  #
  exec { "set-mysql-password-${name}":
  unless  => "/usr/bin/mysqladmin -u${name} -p${pwtxt} status",
  command => "/usr/bin/mysqladmin -u${name} password${pwtxt}",
  require => Service['mysql'],
  }

}
