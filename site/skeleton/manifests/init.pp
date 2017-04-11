class skeleton {
  file { '/etc/skel':
    ensure => directory,  
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { '/etc/skel/.bashrc':
    ensure => present,   # what value should go here?
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    #source => "puppet:///moudules/${moduledir}/bashrc",
    #source => "puppet:///moudules/${moduledir}/bashrc",
  }
  
}
