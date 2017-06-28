# Install php package and service
define php::install ( $version_ensure = 'installed' ) {

  # install php package
  notice("Installing php package version: ${version_ensure}")

  case $version_ensure {
  'php5',
  default: {
    package { 'php5':
      ensure => $version_ensure, # If no specific version is set; just make sure that it is installed
    }
    package { 'php5-mysql':
      ensure  => present,
      require => Package['php5'],
      notify  => Service['apache2'],
    }
  }
  'php7': {
    }
  }

}