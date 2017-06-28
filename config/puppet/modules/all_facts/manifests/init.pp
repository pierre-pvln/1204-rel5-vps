# Class definition
# FileName: init.pp
# Purpose:  show all facts 
# Author:   pierre.veelen@pvln.nl
# Revision: 2017 05 24 - initial version
#
# Inspiration: https://www.puppetcookbook.com/posts/see-all-client-variables.html
#

class all_facts{

  notice ( 'All facts to /tmp/facts.yaml' )
  file { '/tmp/facts.yaml':
    content => inline_template('<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>'),
  }

}