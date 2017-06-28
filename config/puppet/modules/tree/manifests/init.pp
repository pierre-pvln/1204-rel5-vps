# == Class: tree
#
# Performs initial configuration tasks for tree.
#
class tree {

  # install tree package
  notice('Installing tree package')

  package { 'tree':
    ensure  => 'latest',
  }

}
