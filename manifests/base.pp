# === Authors
#
# Author Name <jason@rampaginggeek.com>
#
# === Copyright
#
# Copyright 2013 Jason Edgecombe, unless otherwise noted.
#
class openafs::base {
  include openafs::params

}

Class['kerberos::client'] -> Class['openafs::base']
