# Remove the virtual host
define apache2::vhost::remove($domain='UNSET',$root='UNSET') {

  if $domain == 'UNSET' {
    $vhost_domain = $name
  } else {
    $vhost_domain = $domain
  }

  if $root == 'UNSET' {
    $vhost_root = "/var/www/${name}"
  } else {
    $vhost_root = $root
  }

  # show used settings
  notice( '=============================' )
  notice( 'action  : REMOVE')
  notice( "name    : ${name}" )
  notice( "domain  : ${domain}" )
  notice( "root    : ${root}" )
  notice( '=============================' )
  notice( "vhost_root  : ${vhost_root}" )
  notice( "vhost_domain: ${$vhost_domain}" )
  notice( '=============================' )

#  file { "/etc/apache2/sites-available/${vhost_domain}.conf":
#    content => template('apache2/vhost/vhost.erb'),
#    require => Package['apache2'],
#    notify  => Exec["enable-${vhost_domain}-vhost"],
#  }

  exec { "disable-${vhost_domain}-vhost":
    command => "/usr/sbin/a2dissite ${vhost_domain}.conf",
    notify  => Service['apache2'],
  }

}
