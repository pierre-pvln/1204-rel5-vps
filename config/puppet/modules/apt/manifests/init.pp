# == Class: apt
#
# Performs pre-deployment configuration tasks.
#
class apt {
  notice('Update packages')

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
  }

  exec { 'apt-get autoclean':
    command => '/usr/bin/apt-get autoclean',
  }

#  exec { 'apt-get upgrade':
#    command => '/usr/bin/apt-get upgrade',
#  }
}