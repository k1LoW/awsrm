require 'spec_helper'

RSpec.describe Awsrm::Ec2 do
  before(:each) do
    Awspec::Stub.load 'ec2'
  end

  it '#one().id' do
    expect(Awsrm::Ec2.one(name: 'my-ec2').id).to eq 'i-ec12345a'
  end

  it '#filters' do
    expect(Awsrm::Ec2.filters(name: 'my-ec2')).to eq [{ name: 'tag:Name', values: ['my-ec2'] }]
    expect(Awsrm::Ec2.filters(vpc_id: 'vpc-ab123cde')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
    expect(Awsrm::Ec2.filters(vpc: 'my-vpc')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
  end
end
