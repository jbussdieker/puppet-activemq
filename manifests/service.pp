# == Class: activemq::service
class activemq::service {

  service {'activemq':
    ensure  => running,
    require => Package['activemq'],
  }

}
