# Manage a mysql database
define mysql::db($db_user,$db_user_pw, $action='LIST') {

case $action {
  'LIST':   { mysql::db::list{ $name: user => $db_user, password => $db_user_pw,} }
  'CREATE': { mysql::db::create{ $name: user => $db_user, password => $db_user_pw,}}
  'REMOVE': { mysql::db::remove{ $name: user => $db_user, password => $db_user_pw,} }
  default:  { }
  }

}

