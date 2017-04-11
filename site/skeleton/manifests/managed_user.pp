define skeleton::managed_user (
  $home = undef,
  $password = undef,
  
) {
  if $home {
    $homedir = $home
  }
  else {
    $homedir = $osfamily ? {
      'windows' => "C:/Users/${name}",
      'RedHat'  => "/home/${name}",
    }
  }

  if $osfamily == 'windows' {
    # set resource defaults so the file properties are set appropriately
    File {
      owner => $name,
      group => 'Administrators',
      mode  => '0664',
    }
    User {
      groups => ['Administrators', 'Users'],
    }

    # evaluated each time a powershell session starts
    file { "${homedir}/Documents/WindowsPowerShell/profile.ps1":
      ensure => file,
      source => 'puppet:///modules/skeleton/profile.ps1',
    }

    file { "${homedir}/Documents/WindowsPowerShell":
      ensure => directory,
    }

  }
  else {
    File {
      owner => $name,
      group => 'wheel',
      mode  => '0644',
    }

    # TODO: Add a file resource to manage "${homedir}/.bashrc"
    file { "${homedir}/.bashrc":
      ensure => file,
    }

  }

  # Puppet will evaluate these resources in the proper order because it's smart
  # and knows about dependencies between files and their owners

  user { $name:
    ensure     => present,
    managehome => true,
    password   => $password,
    # TODO: Pass the password parameter to this resource
    
  }

  file { $homedir:
    ensure => directory,
  }
}
