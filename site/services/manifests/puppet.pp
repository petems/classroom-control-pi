class services::puppet {
  # ensure the puppet service doesn't interfere with our testing
   service { 'puppet':
     ensure => running,
     enable => true,
  }
}
