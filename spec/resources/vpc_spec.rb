require 'spec_helper'

RSpec.describe Awsrm::Vpc do
  before(:each) do
    Awspec::Stub.load 'vpc'
  end

  it '#one().id' do
    expect(Awsrm::Vpc.one(name: 'my-vpc').id).to eq 'vpc-ab123cde'
  end

  it '#filters' do
    expect(Awsrm::Vpc.filters(name: 'my-vpc')).to eq [{ name: 'tag:Name', values: ['my-vpc'] }]
    expect(Awsrm::Vpc.filters(id: 'vpc-ab123cde')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
    expect(Awsrm::Vpc.filters(vpc_id: 'vpc-ab123cde')).to eq [{ name: 'vpc-id', values: ['vpc-ab123cde'] }]
  end

  it '#one().* access Aws::EC2::Types::Vpc' do
    expect(Awsrm::Vpc.one(name: 'my-vpc').state).to eq 'available'
  end
end
