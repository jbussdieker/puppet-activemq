require 'spec_helper'

describe 'activemq::config' do
  it { should contain_file('/etc/default/activemq') }
end
