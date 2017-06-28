# Manage an Apache virtual host
define apache2::vhost($domain='UNSET',$root='UNSET', $action='LIST') {

case $action {
  'LIST':   { apache2::vhost::list{
              $name:
              domain => $domain,
              root   => $root,}
            }
  'CREATE': { apache2::vhost::create{
              $name:
              domain => $domain,
              root   => $root,}
            }
  'REMOVE': { apache2::vhost::remove{
              $name:
              domain => $domain,
              root   => $root,}
            }
  default:  {
            }
  }

}

