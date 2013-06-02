# === Authors
#
# Jason Edgecombe <jason@rampaginggeek.com>
#
# === Copyright
#
# Copyright 2013 Jason Edgecombe, unless otherwise noted.
#
class openafs::client($cell = 'example.com') inherits openafs::base {
  include openafs::base

  package { 'openafs-client-packages' :
    ensure => present,
    name   => $openafs::params::client_packages,
    before => Service['openafs-client'],
  }

  exec { 'install-precompiled-openafs-kernel-module':
    command  => "/usr/bin/dpkg -i $openafs::params::dkms_deb",
    unless   => "/usr/sbin/dkms status -m openafs | /bin/grep -qs installed",
    require  => Package['openafs-client-packages'],
    before   => Service['openafs-client'],
  }
  
  service { 'openafs-client':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
