# Install the virtual host
define apache2::vhost::create($domain='UNSET',$root='UNSET') {

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
  notice( 'action  : CREATE')
  notice( "name    : ${name}" )
  notice( "domain  : ${domain}" )
  notice( "root    : ${root}" )
  notice( '=============================' )
  notice( "vhost_root  : ${vhost_root}" )
  notice( "vhost_domain: ${$vhost_domain}" )
  notice( '=============================' )

  file { "/etc/apache2/sites-available/${vhost_domain}.conf":
    content => template('apache2/vhost/vhost.erb'),
    require => Package['apache2'],
    notify  => Exec["enable-${vhost_domain}-vhost"],
  }

  exec { "enable-${vhost_domain}-vhost":
    command     => "/usr/sbin/a2ensite ${vhost_domain}.conf",
    require     => File["/etc/apache2/sites-available/${vhost_domain}.conf"],
    refreshonly => true,
    notify      => Service['apache2'],
  }

  # creating directory for basic content, including permissions and ownership
  # directory MUST be created before its possible to put files in it
  file { $vhost_root:
    ensure  => 'directory',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0775',
    require => Package['apache2'],
  }

  #create basic content
  file { "${vhost_root}/index.html":
    content => template('apache2/vhost/basic-html.erb'),
    owner   => 'www-data',
    group   => 'www-data',
    require => Package['apache2'],
  }

}
