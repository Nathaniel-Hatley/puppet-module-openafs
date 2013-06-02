# === Authors
#
# Jason Edgecombe <jason@rampaginggeek.com>
#
# === Copyright
#
# Copyright 2013 Jason Edgecombe, unless otherwise noted.
#
class openafs::params {

  case $::operatingsystem {
    Ubuntu: {
      $client_packages     = [ 'openafs-client','openafs-krb5','openafs-modules-dkms' ]
      $fileserver_packages = [ 'openafs-fileserver','openafs-krb5' ]
      $dbserver_packages   = [ 'openafs-dbserver' ]
      $server_thiscell     = '/etc/openafs/server/ThisCell'
      $server_cellservdb   = '/etc/openafs/server/CellServDB'
      $bos                 = '/usr/bin/bos'
      $dkms_deb            = '/vagrant/deb/openafs-dkms_1.6.1_all.deb'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems")
    }
  }
}
