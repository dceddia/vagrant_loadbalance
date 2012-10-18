exec { "apt-get update":
  command => "/usr/bin/apt-get update",
}

package {"haproxy":
  ensure => present,
}

file { "/etc/haproxy/haproxy.cfg":
  notify => Service["haproxy"],
  owner => root,
  group => root,
  mode => 644,
  source => "/vagrant/haproxy/haproxy.cfg-dist",
  require => Package["haproxy"],
}

file { "/etc/default/haproxy":
  notify => Service["haproxy"],
  owner => root,
  group => root,
  mode => 644,
  source => "/vagrant/haproxy/haproxy-enable",
  require => Package["haproxy"],
}

service { "haproxy":
  enable => true,
  ensure => "running",
  require => Package["haproxy"]
}

include vim
