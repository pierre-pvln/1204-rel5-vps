# Remove apache2 package and service
define apache2::remove ( $remove_as = 'absent' ) {

# If no specific remove type is set; just make sure that it is 'absent'
# Remove a package but leave its config files alone use: 'absent'
# Remove a package and purge its config files use: 'purged'

  notice("Removing apache2 package version: ${remove_as}")

  package { 'apache2':
    ensure => $remove_as,
  }

  # ensure apache2 service is not running anymore
  service { 'apache2':
    ensure => 'stopped',  #service is stopped  
    enable => false,      #should not run on boot time
  }
}
