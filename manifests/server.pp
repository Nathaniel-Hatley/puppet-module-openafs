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

  package { 'openafs-fileserver-packages' :
    ensure => present,
    name   => $openafs::params::fileserver_packages,
    before => Service['openafs-fileserver'],
  }

  package { 'openafs-dbserver-packages' :
    ensure => $is_dbserver ? {
      'true'  => 'present',
      'false' => 'absent',
      default => undef,
    },
    name   => $openafs::params::dbserver_packages,
    before => Service['openafs-fileserver'],
  }

  service { 'openafs-fileserver':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
