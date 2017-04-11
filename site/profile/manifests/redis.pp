class profile::redis ( 
$master = false,
) {
  # We'll require our epel class so that it is enforced first.
  # Don't forget to update that class before enforcing your code
  require profile::epel
  
  if $master {
    $slaveof = undef
    $bindaddress = '127.0.0.1'
  }
    else {
      $slaveof = 'master.puppetlabs.vm 6479'
      $bindaddress = $ipaddress
    }
    
  class { 'redis':
    # what parameter should we pass to set maxmemory to 10mb?
    maxmemory => '10mb',
    bind => $bindaddress,
    slaveof => $slaveof,
  }
}

