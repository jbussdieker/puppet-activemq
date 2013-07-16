require 'spec_helper'

describe 'activemq::package' do
  it { should contain_package('activemq') }
end
