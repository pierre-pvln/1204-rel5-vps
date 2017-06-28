# Create a MySQL database/user
define mysql::db::create($user,$password) {

  # show used settings
  notice( '=============================' )
  notice( 'action      : CREATE')
  notice( "db_name     : ${name}" )
  notice( "db_user     : ${user}" )
  notice( "db_user_pw  : ${password}" )
  notice( '=============================' )

  exec { "create-${name}-db":
    unless  => "/usr/bin/mysql -u${user} -p${password} ${name}",
    command => "/usr/bin/mysql -uroot -p${configs::mysql_main_pw} -e \"create database ${name};
    grant all on ${name}.* to ${user}@'localhost' identified by '${password}';
    grant all on ${name}.* to ${user}@'%' identified by '${password}'; flush privileges;\"",
    require => [
      Service['mysql'],
      Mysql::Admin::Create['root'],
      ]
  }
}

