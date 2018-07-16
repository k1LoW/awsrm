require 'spec_helper'

RSpec.describe Awsrm::SecurityGroup do
  before(:each) do
    Awspec::Stub.load 'security_group'
  end

  it '#one().id' do
    expect(Awsrm::SecurityGroup.one(name: 'my-security-group-name').id).to eq 'sg-1a2b3cd4'
  end

  it '#filters' do
    expect(Awsrm::SecurityGroup.filters(name: 'my-security-group-name')).to eq [{ name: 'tag:Name',
                                                                                  values: ['my-security-group-name'] }]
    expect(Awsrm::SecurityGroup.filters(vpc_id: 'vpc-ab123cde')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
    expect(Awsrm::SecurityGroup.filters(vpc: 'my-vpc')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
  end

  it '#one().* access Aws::EC2::Types::SecurityGroups' do
    expect(Awsrm::SecurityGroup.one(name: 'my-security-group-name').entries.count).to eq 8
  end
end
