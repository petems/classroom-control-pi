class troubleshooting::provisioning {

  if $osfamily == 'RedHat' {
    include apache

    file { '/var/www/html/index.html':
      ensure => file,
      source => 'puppet:///modules/troubleshooting/index.html',
    }
    file { '/var/www/html/live.gif':
      ensure => file,
      source => 'puppet://modules/troubleshooting/live.gif',
    }
  }

  $facts_dot_d = $osfamily ? {
    'RedHat'  => '/etc/puppetlabs/facter/facts.d',
    'windows' => 'C:/ProgramData/PuppetLabs/facter/facts.d',
  }
  file { "${facts_dot_d}/provisioned.txt":
    ensure => file,
    source => 'puppet:///modules/troubleshooting/provisioned.txt',
  }
}
