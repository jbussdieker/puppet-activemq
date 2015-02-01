class activemq::service {

  service {'activemq':
    ensure  => running,
    require => Package['activemq'],
  }

}
