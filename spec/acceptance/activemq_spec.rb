require 'spec_helper_acceptance'

describe 'activemq module' do
  let(:manifest) {
    <<-EOS
      class { 'activemq': }
      activemq::instance { 'myqueue':
        openwire               => true,
        openwire_port          => 6166,
        stomp_nio              => true,
        stomp_nio_port         => 6163,
        stomp_queue            => true,
        stomp_queue_port       => 61613,
        user_name              => 'myuser',
        user_password          => 'myuser',
        user_groups            => 'users,everyone',
        user_auth_queue        => 'myqueue.>',
        user_auth_topic        => 'myqueue.>',
        admin_name             => 'admin',
        admin_password         => 'admin',
        admin_groups           => 'admins,everyone',
        admin_auth_queue       => '>',
        admin_auth_topic       => '>',
        authentication_enabled => true,
        authorization_enabled  => true
      }
    EOS
  }

  describe 'running puppet code' do
    it 'should work with no errors' do
      # Run it twice and test for idempotency
      apply_manifest(manifest, :catch_failures => true)
      expect(apply_manifest(manifest, :catch_changes => true).exit_code).to be_zero
    end
  end

  describe 'ports' do
    it 'should listen on 6163' do
      shell("lsof -i:6163", :acceptable_exit_codes => 0)
    end

    it 'should listen on 6166' do
      shell("lsof -i:6166", :acceptable_exit_codes => 0)
    end

    it 'should listen on 61613' do
      shell("lsof -i:61613", :acceptable_exit_codes => 0)
    end
  end
end
