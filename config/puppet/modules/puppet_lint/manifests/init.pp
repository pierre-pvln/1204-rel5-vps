# == Class: puppet_lint
#
# Performs initial install of puppet-lint.
#
class puppet_lint {

  package { 'rubygems':
    ensure => present,
  }

  package { 'puppet-lint':
    ensure   => 'latest',
    provider => 'gem',
	require  => Package['rubygems'],
  }
}
