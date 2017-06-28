# Create the scripts directory
define scripts::dir( $script_dir='UNSET') {

  if $script_dir == 'UNSET' {
    $vhost_scripts = "/var/www/${name}/scripts"
  } else {
    $vhost_scripts = $script_dir
  }

  # show used settings
  notice( '=============================' )
  notice( "name            : ${name}" )
  notice( "script directory: ${script_dir}" )
  notice( '=============================' )
  notice( "vhost_scripts   : ${vhost_scripts}" )
  notice( '=============================' )

  # creating directory for basic content, including permissions and ownership
  # directory MUST be created before its possible to put files in it
  file { $vhost_scripts:
    ensure  => 'directory',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0775',
    require => Package['apache2'],
  }

}
