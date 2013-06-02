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

  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>
}

Class['kerberos::client'] -> Class['openafs::base']
