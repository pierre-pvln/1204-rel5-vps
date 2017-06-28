#
#
#
class common {
  notice( '===== CLASS COMMON ===================' )
  notice( "Operating system : ${::operatingsystem}" )
  notice( "Hostname/Nodename: ${::hostname}" )
  notice( '======================================' )

  include stdlib
  #include puppet_lint
  include all_facts
  
}