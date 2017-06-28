# List the virtual host
define apache2::vhost::list($domain='UNSET',$root='UNSET') {

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
  notice( 'action  : LIST')
  notice( "name    : ${name}" )
  notice( "domain  : ${domain}" )
  notice( "root    : ${root}" )
  notice( '=============================' )
  notice( "vhost_root  : ${vhost_root}" )
  notice( "vhost_domain: ${$vhost_domain}" )
  notice( '=============================' )

}
