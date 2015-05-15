Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }

include bootstrap
include tools
include known_hosts
include git
include apache
include php
include php::pear
include php::pecl
include mysql
include elk
