class profile::redis
(
  $master = false,
  $bind_ip = '127.0.0.1',
) 
{
  require profile::epel

  if $master {
    $slaveof= undef
  } else {
   $slaveof = 'master.puppetlabs.vm 6479'
  }

  class {'redis':
    maxmemory => '10mb',
    bind      => $bind_ip,
    slaveof   => $slaveof,
  }
}
