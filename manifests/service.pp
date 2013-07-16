class activemq::service {

  service {'activemq':
    ensure => running,
  }

}
