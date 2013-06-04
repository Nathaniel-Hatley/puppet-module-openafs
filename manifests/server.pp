# === Authors
#
# Jason Edgecombe <jason@rampaginggeek.com>
#
# === Copyright
#
# Copyright 2013 Jason Edgecombe, unless otherwise noted.
#
class openafs::server($cell = 'example.com', $is_dbserver='false') inherits openafs::base {
  include openafs::base

  package { $openafs::params::fileserver_packages :
    ensure => 'present',
    before => Service['openafs-fileserver'],
  }

  package { $openafs::params::dbserver_packages :
    ensure => $is_dbserver ? {
      'true'  => 'present',
      'false' => 'absent',
      default => undef,
    },
    before => Service['openafs-fileserver'],
  }

  service { 'openafs-fileserver':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
