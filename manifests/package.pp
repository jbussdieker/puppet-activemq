# == Class: activemq::package
class activemq::package {

  package {'activemq':
    ensure  => present,
  }

}
