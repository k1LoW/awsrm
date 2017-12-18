require 'spec_helper'

RSpec.describe Awsrm::Elb do
  before(:each) do
    require 'stub/elb'
  end

  it '#one().id' do
    expect(Awsrm::Elb.one(id: 'my-elb').id).to eq 'my-elb'
    expect(Awsrm::Elb.one(name: 'my-elb').id).to eq 'my-elb'
    expect(Awsrm::Elb.one(dns_name: 'internal-my-elb-1551266724.ap-northeast-1.elb.amazonaws.com').id).to eq 'my-elb'
    expect(Awsrm::Elb.one(tags: { Dept: 'Research', Role: 'WebServer' }).id).to eq 'my-elb'
    expect(Awsrm::Elb.one(vpc: 'my-vpc').id).to eq 'my-elb'
  end

  it '#one().* access Aws::ElasticLoadBalancing::Types::Types::LoadBalancerDescription>' do
    expect(Awsrm::Elb.one(name: 'my-elb').dns_name).to eq 'internal-my-elb-1551266724.ap-northeast-1.elb.amazonaws.com'
  end
end
