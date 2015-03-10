# == Define: activemq::instance
define activemq::instance(
  $instance_name    = '',
  $openwire         = true,
  $openwire_port    = 6166,
  $stomp_nio        = true,
  $stomp_nio_port   = 6163,
  $stomp_queue      = true,
  $stomp_queue_port = 61613,

  $user_name        = 'guest',
  $user_password    = 'guest',
  $user_groups      = 'users,everyone',
  $user_auth_queue  = '',
  $user_auth_topic  = '',

  $admin_name       = 'admin',
  $admin_password   = 'admin',
  $admin_groups     = 'admins,everyone',
  $admin_auth_queue  = '>',
  $admin_auth_topic  = '>',
) {

  if $instance_name != '' {
    $real_name = $instance_name
  } else {
    $real_name = $name
  }

  if $user_auth_queue == '' {
    $real_user_auth_queue = "${real_name}.>"
  } else {
    $real_user_auth_queue = $user_auth_queue
  }

  if $user_auth_topic == '' {
    $real_user_auth_topic = "${real_name}.>"
  } else {
    $real_user_auth_topic = $user_auth_topic
  }


  $instance_path = "/etc/activemq/instances-available/${real_name}"
  $instance_enabled_path = "/etc/activemq/instances-enabled/${real_name}"

  File {
    notify => Service['activemq'],
  }

  file { $instance_path:
    ensure  => directory,
    require => Package['activemq'],
  }

  file {"${instance_path}/activemq.xml":
    ensure  => present,
    content => template('activemq/activemq.xml.erb'),
    require => File[$instance_path],
  }

  file {"${instance_path}/log4j.properties":
    ensure  => present,
    content => template('activemq/log4j.properties.erb'),
    require => File[$instance_path],
  }

  file {"${instance_path}/credentials.properties":
    ensure  => present,
    content => template('activemq/credentials.properties.erb'),
    require => File[$instance_path],
  }

  file { $instance_enabled_path:
    ensure  => link,
    target  => $instance_path,
    require => [
      File["${instance_path}/activemq.xml"],
      File["${instance_path}/log4j.properties"],
      File["${instance_path}/credentials.properties"],
    ],
  }
}
