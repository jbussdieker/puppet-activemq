class activemq(
  $user = 'activemq',
  $instances = {}
) {

  class {'activemq::package':
  }

  class {'activemq::config':
  }

  class {'activemq::service':
  }

  create_resources('activemq::instance', $instances)

}
