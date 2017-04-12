## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

#node gdunk.puppetlabs.vm {
#  notify { "This is the linux VM, very exciting": }
#}

#node gdunkwin.puppetlabs.vm {
#  notify { "I am a windows machine, hopefully" : }
#  registry_value { 'HKLM\System\CurrentControlSet\Services\Puppet\Description':
#    ensure => present,
#    type   => string,
#    data   => "The Puppet Agent service periodically manages your configuration",
#  }
#}

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  
  # example code for the classroom
  include examples::puppetize
  
  #notify { "This is the default message from the production environment": }
  #notify { "Hello from Grant, this is the third update, running on ${::fqdn}": }
  
  #exec { 'cowsay_motd':
  #  command   => "/usr/local/bin/cowsay 'Welcome to ${::fqdn}!' > /etc/motd",
  #  creates    => '/etc/motd',
  #}
  
  $message = hiera('message')
  $message2 = hiera('grantmessage')
  
  unless $environment in [ 'production', 'staging' ] {
    #notify { "Warning: this is a development environment on ${::fqdn}": }
    notify { "env is $environment": }
    notify { "Primary disk is ${::disks['sda']['size']} in size.": } 
  }
}
