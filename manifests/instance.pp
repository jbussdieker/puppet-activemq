define activemq::instance(
  $name             = "main",
  $openwire         = true,
  $openwire_port    = 6166,
  $stomp_nio        = true,
  $stomp_nio_port   = 6163,
  $stomp_queue      = true,
  $stomp_queue_port = 61613,

  $user_name        = "mcollective",
  $user_password    = "secret",
  $user_groups      = "users,everyone",
  $user_auth_queue  = "mcollective.>",
  $user_auth_topic  = "mcollective.>",

  $admin_name       = "admin",
  $admin_password   = "secret",
  $admin_groups     = "admins,everyone",
  $admin_auth_queue  = ">",
  $admin_auth_topic  = ">",
) {

  $instance_path = "/etc/activemq/instances-available/${::name}"
  $instance_enabled_path = "/etc/activemq/instances-enabled/${::name}"

  file { $instance_path:
    ensure => directory,
  }

  file {"${instance_path}/activemq.xml":
    ensure  => present,
    content => template('activemq/activemq.xml.erb'),
    require => File[$instance_path],
  }

  file {"${instance_path}/log4j.properties":
    ensure  => present,
    source  => template('activemq/log4j.properties'),
    require => File[$instance_path],
  }

  file {"${instance_path}/credentials.properties":
    ensure  => present,
    source  => template('activemq/credentials.properties'),
    require => File[$instance_path],
  }

  file { $instance_enabled_path:
    ensure => link,
    target => $instance_path,
    require => [
      File["${instance_path}/activemq.xml"],
      File["${instance_path}/log4j.properties"],
      File["${instance_path}/credentials.properties"],
    ],
  }
}
