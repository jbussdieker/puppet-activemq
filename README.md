# ActiveMQ Module

[![Build Status](https://travis-ci.org/jbussdieker/puppet-activemq.png?branch=master)](https://travis-ci.org/jbussdieker/puppet-activemq)

This module manages installing, configuring and running ActiveMQ.

# Usage

Basic installation:

    class {'activemq':
    }

Advanced installation:

    class {'activemq':
      user => 'someuser',
    }

Basic mcollective queue:

    activemq::instance {'mcollective':
    }

Advanced custom configuration:

    activemq::instance {'myqueue':
      openwire         = true,
      openwire_port    = 6166,
      stomp_nio        = true,
      stomp_nio_port   = 6163,
      stomp_queue      = true,
      stomp_queue_port = 61613,
      user_name        = 'myuser',
      user_password    = 'myuser',
      user_groups      = 'users,everyone',
      user_auth_queue  = 'myqueue.>',
      user_auth_topic  = 'myqueue.>',
      admin_name       = 'admin',
      admin_password   = 'admin',
      admin_groups     = 'admins,everyone',
      admin_auth_queue = '>',
      admin_auth_topic = '>',
    }
