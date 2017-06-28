# copy file in the scripts directory
define scripts::file($script_directory='UNSET') {

  if $script_directory == 'UNSET' {
    $vhost_dir = '/var/www/scripts'
  } else {
    $vhost_dir = "/var/www/${script_directory}/scripts"
  }

  # show used settings
  notice( '=============================' )
  notice( "filename                    : ${name}" )
  notice( "script directory destination: ${script_directory}" )
  notice( '=============================' )
  notice( "vhost_dir destination       : ${vhost_dir}" )
  notice( '=============================' )

  # ensure script_file exists
  file { "${vhost_dir}/${name}" :
    ensure  => file,
    source  => "puppet:///modules/scripts/${name}",
      #
      # NOTE: directory holding the file is /modules/scripts/files/
      # and not /modules/scripts/
      #
      # More info: https://docs.puppetlabs.com/guides/file_serving.html
      #
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0664',
    require => [
      Service['apache2'], # require 'apache2' service before creating
      Package['php5'],    # require 'php5' package before creating
      File[ $vhost_dir ], # directory should be available before files is created
      ],
  }

}
