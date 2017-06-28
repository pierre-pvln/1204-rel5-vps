# Install mysql package and service
define mysql::install ( $version_ensure = 'installed' ) {

  # install mysql-server package
  notice("Installing mysql package version: ${version_ensure}")

  package { 'mysql-server':
    ensure => $version_ensure, # If no specific version is set; just make sure that it is installed
  }

  # ensure mysql service is running
  service { 'mysql':
    ensure  => running,
    enable  => true,
    require => Package['mysql-server'],
  }

  # deploy settings file
  file { '/etc/mysql/my.cnf':
  source  => 'puppet:///modules/mysql/my.cnf',
  owner   => 'mysql',
  group   => 'mysql',
  require => Package['mysql-server'],
  notify  => Service['mysql'],

}

}
