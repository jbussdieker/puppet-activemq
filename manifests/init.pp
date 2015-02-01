class activemq(
  $user = 'activemq',
  $instances = {}
) {

  include java
  
  class {'activemq::package':
  }

  class {'activemq::config':
  }

  class {'activemq::service':
  }

  create_resources('activemq::instance', $instances)

}
