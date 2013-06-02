# === Authors
#
# Jason Edgecombe <jason@rampaginggeek.com>
#
# === Copyright
#
# Copyright 2013 Jason Edgecombe, unless otherwise noted.
#
class openafs::server::fileserver($cell = 'example.com') inherits openafs::base {
  include openafs::base

  package { 'openafs-fileserver-packages' :
    ensure => present,
    name   => $openafs::params::fileserver_packages,
  }

  service { 'openafs-fileserver':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
