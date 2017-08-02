require 'spec_helper'

RSpec.describe Awsrm::VpnConnection do
  before(:each) do
    Awspec::Stub.load 'vpn_connection'
  end

  it '#one().id' do
    expect(Awsrm::VpnConnection.one(name: 'my-vpn').id).to eq 'vpn-cg5692g4'
  end

  it '#filters' do
    expect(Awsrm::VpnConnection.filters(id: 'vpn-cg5692g4')).to eq [{ name: 'vpn-connection-id',
                                                                      values: ['vpn-cg5692g4'] }]
    expect(Awsrm::VpnConnection.filters(vpn_connection_id: 'vpn-cg5692g4')).to eq [{ name: 'vpn-connection-id',
                                                                                     values: ['vpn-cg5692g4'] }]
    expect(Awsrm::VpnConnection.filters(name: 'my-vpn')).to eq [{ name: 'tag:Name', values: ['my-vpn'] }]
  end

  it '#one().* access Aws::EC2::Types::VpnConnection' do
    expect(Awsrm::VpnConnection.one(name: 'my-vpn').type).to eq 'ipsec.1'
  end
end
