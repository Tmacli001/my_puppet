#puppet test instances
#方法二：
package {'apache':
    name => 'httpd',
    ensure => installed,
    before => File['apache-conf'],
}
file {'apache-conf':
    name => '/etc/httpd/conf/httpd.conf'
    ensure => file,
    mode => 600,
    source => '/etc/puppet/files/httpd.conf'
    notify => Service['apache'],
}
service {'apache':
    name => 'httpd',
    ensure => running,
    enable => true,
}
#方法三：
package {'apache':
    name => 'httpd',
    ensure => installed,
}
->
file {'apache-conf':
    name => '/etc/httpd/conf/httpd.conf'
    ensure => file,
    mode => 600,
    source => '/etc/puppet/files/httpd.conf'
}
->
service {'apache':
    name => 'httpd',
    ensure => running,
    enable => true,
}

