require 'spec_helper'

RSpec.describe Awsrm::Alb do
  before(:each) do
    Awspec::Stub.load 'alb'
  end

  it '#one().id' do
    expect(Awsrm::Alb.one(id: 'my-alb').id).to eq 'my-alb'
    expect(Awsrm::Alb.one(name: 'my-alb').id).to eq 'my-alb'
    # rubocop:disable Metrics/LineLength
    expect(Awsrm::Alb.one(arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:loadbalancer/app/my-alb/1aa1bb1cc1ddee11').id).to eq 'my-alb'
    # rubocop:enable Metrics/LineLength
    expect(Awsrm::Alb.one(dns_name: 'internal-my-elb-1551266724.ap-northeast-1.elb.amazonaws.com').id).to eq 'my-alb'
  end

  it '#one().* access Aws::ElasticLoadBalancingV2::Types::LoadBalancer' do
    expect(Awsrm::Alb.one(name: 'my-alb').dns_name).to eq 'internal-my-elb-1551266724.ap-northeast-1.elb.amazonaws.com'
  end
end
