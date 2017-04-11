class skeleton {
  file { '/etc/skel':
    ensure => directory,   # what value should go here?
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  
  file { '/etc/skel/.bashrc':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/skeleton/bashrc',
  }
    
  # add a resource to manage /etc/skel/.bashrc


}
