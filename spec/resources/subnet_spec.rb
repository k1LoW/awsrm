require 'spec_helper'

RSpec.describe Awsrm::Subnet do
  before(:each) do
    Awspec::Stub.load 'subnet'
  end

  it '#one().id' do
    expect(Awsrm::Subnet.one(name: 'my-subnet').id).to eq 'subnet-1234a567'
  end

  it '#filters' do
    expect(Awsrm::Subnet.filters(name: 'my-subnet')).to eq [{ name: 'tag:Name', values: ['my-subnet'] }]
    expect(Awsrm::Subnet.filters(vpc_id: 'vpc-ab123cde')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
    expect(Awsrm::Subnet.filters(vpc: 'my-vpc')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
    expect(Awsrm::Subnet.filters(cidr: '10.0.1.0/24')).to eq [{ name: 'cidrBlock', values: ['10.0.1.0/24'] }]
  end

  it '#one().* access Aws::EC2::Types::Subnet' do
    expect(Awsrm::Subnet.one(name: 'my-subnet').state).to eq 'available'
  end
end
