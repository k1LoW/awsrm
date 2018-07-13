require 'spec_helper'

RSpec.describe Awsrm::NetworkAcl do
  before(:each) do
    Awspec::Stub.load 'network_acl'
  end

  it '#one().id' do
    expect(Awsrm::NetworkAcl.one(name: 'my-network-acl').id).to eq 'acl-1abc2d3e'
  end

  it '#filters' do
    expect(Awsrm::NetworkAcl.filters(name: 'my-network-acl')).to eq [{ name: 'tag:Name', values: ['my-network-acl'] }]
    expect(Awsrm::NetworkAcl.filters(vpc_id: 'vpc-ab123cde')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
    expect(Awsrm::NetworkAcl.filters(vpc: 'my-vpc')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
  end

  it '#one().* access Aws::EC2::Types::NetworkAcl' do
    expect(Awsrm::NetworkAcl.one(name: 'my-network-acl').entries.count).to eq 5
  end
end
