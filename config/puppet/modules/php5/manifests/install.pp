# Install php5 package and service
define php5::install ( $version_ensure = 'installed' ) {

  # install php5 package
  notice("Installing php5 package version: ${version_ensure}")

  package { 'php5':
    ensure => $version_ensure, # If no specific version is set; just make sure that it is installed
  }

  # install mysql package
  package { 'php5-mysql':
    ensure  => present,
    require => Package['php5'],
    notify  => Service['apache2'],
  }

  # 20170314 install PHP Graphics Draw library, required for some Joomla! plugins
  package { 'php5-gd':
    ensure  => present,
    require => Package['php5'],
    notify  => Service['apache2'],
  }

  #20170526 add the settings file
  # deploy settings file
  file { '/etc/php5/apache2/php.ini':
    source  => 'puppet:///modules/php5/php.ini',
    #owner   => 'mysql',
    #group   => 'mysql',
    require => Package['php5'],
    notify  => Service['apache2'],
  }

  #20170529 change specific settings for Joomla!
  ini_setting { 'post_max_size':
    ensure  => present,
    section => 'PHP',
    path    => '/etc/php5/apache2/php.ini',
    setting => 'post_max_size',
    value   => '20M',
  }

  #20170529 change specific settings for Joomla!
  ini_setting { 'upload_max_filesize':
    ensure  => present,
    section => 'PHP',
    path    => '/etc/php5/apache2/php.ini',
    setting => 'upload_max_filesize',
    value   => '20M',
  }

}