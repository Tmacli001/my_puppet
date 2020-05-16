#Puppet list
package {'apache':
    name => 'httpd',
    ensure => installed,
}
file {'apache-conf':
    name => '/etc/httpd/conf/httpd.conf',
    ensure => file,
    mode => 600,
    source => '/etc/puppet/files/httpd.conf',
    require => Package['apache'],
    #数据包的依赖关系是先要安装apache后再有配置文件修改
}
service {'apache':
    name => 'httpd',
    ensure => running,
    enable => true,
    subscribe => File['apahce-conf'],
}
