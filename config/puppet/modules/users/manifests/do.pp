#
#
#
define users::do($action='LIST', $usertype='BASIC') {

case $action {
  'LIST':   { users::do::list{
              $name:
              usertype => $usertype,
              }
            }
  'CREATE': { users::do::create{
              $name:
              usertype => $usertype,
              }
            }
  'REMOVE': { users::do::remove{
              $name:
              usertype => $usertype,
              }
            }
  default:  {
            }
  }

}
