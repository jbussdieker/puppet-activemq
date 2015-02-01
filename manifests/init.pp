class activemq(
  $user = 'activemq',
  $instances = {}
) {

  class {'activemq::package':
  }

  class {'activemq::config':
    notify  => Class['activemq::service'],
    require => Class['activemq::package'],
  }

  class {'activemq::service':
    require => Class['activemq::config'],
  }

  create_resources('activemq::instance', $instances)

}
