class activemq::config {

  file {'/etc/default/activemq':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('activemq/default.erb'),
  }

}
