require 'spec_helper'

describe 'activemq' do
  let(:facts) do
    {
      :osfamily => osfamily,
      :lsbdistcodename => lsbdistcodename,
      :operatingsystem => operatingsystem,
      :operatingsystemmajrelease => operatingsystemmajrelease
    }
  end

  let(:osfamily) { 'Debian' }
  let(:lsbdistcodename) { 'trusty' }
  let(:operatingsystem) { 'Ubuntu' }
  let(:operatingsystemmajrelease) { '12.04' }

#  context 'CentOS' do
#    let(:operatingsystem) { 'CentOS' }
#
#    context '7' do
#      let(:operatingsystemmajrelease) { '7' }
#    end
#  end

  it { should contain_class('activemq::package') }
  it { should contain_class('activemq::config') }
  it { should contain_class('activemq::service') }
end
