# == Class: vps_stages
#
# Defines additional stages for puppet
#
class vps_stages {

  stage { 'pre-stage':
    before  => Stage['main'],
  }

  stage { 'post-stage':
    require => Stage['main'],
  }

}
