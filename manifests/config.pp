# == Class: activemq::config
class activemq::config {

  $user = $::activemq::user

  file {'/etc/default/activemq':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('activemq/default.erb'),
    require => Package['activemq'],
    notify  => Service['activemq'],
  }

}
