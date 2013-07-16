require 'spec_helper'

describe 'activemq::service' do
  it { should contain_service('activemq') }
end
