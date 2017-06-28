# Install apache2 package and service
define apache2::install ( $version_ensure = 'installed' ) {

# If no specific version is set; just make sure that it is installed

  notice("Installing apache2 package version: ${version_ensure}")

  package { 'apache2':
    ensure => $version_ensure,
  }

  # ensure apache2 service is running
  service { 'apache2':
    ensure  => running,
    enable  => true,                #should run on boot time
    require => Package['apache2'],
  }

  # Activate mod_rewrite for joomla sites

  apache2::loadmodule{ 'rewrite': }
}
