class aliases (
    $admin = 'root',
) {
    # uses $admin to build the aliases file
    # TODO: Add the function call to generate text from a template
    file { '/etc/aliases':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => content => epp('aliases/aliases.epp'),
    }
    exec { '/usr/bin/newaliases':
        refreshonly => true,
        subscribe   => File['/etc/aliases'],
    }
}
