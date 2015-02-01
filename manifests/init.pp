class activemq(
  $user = 'activemq',
  $instances = {}
) {

  include java
  
  class {'activemq::package':
  }

  class {'activemq::config':
    notify  => Class['activemq::service'],
    require => Class['activemq::package'],
  }

  class {'activemq::service':
    require => [
      Class['activemq::config'],
      Class['java'],
    ],
  }

  create_resources('activemq::instance', $instances)

}
