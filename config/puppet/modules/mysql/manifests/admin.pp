# Manage a mysql database administratorr
define mysql::admin($pwtxt, $action='LIST') {

case $action {
  'LIST':   { mysql::admin::list{ $name: pwtxt => $pwtxt,} }
  'CREATE': { mysql::admin::create{ $name: pwtxt => $pwtxt,}}
  'REMOVE': { mysql::admin::remove{ $name: pwtxt => $pwtxt,} }
  default:  { }
  }

}

