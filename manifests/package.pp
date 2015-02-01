class activemq::package {

  package {'activemq':
    ensure  => present,
    require => Package['java'],
  }

}
