# enable apache2 modules
define apache2::loadmodule () {
  exec { "/usr/sbin/a2enmod ${name}" :
          unless => "/bin/readlink -e /etc/apache2/mods-enabled/${name}.load",
          notify => Service['apache2'],
  }
}
