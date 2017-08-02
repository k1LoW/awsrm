require 'spec_helper'

# rubocop:disable Metrics/LineLength
RSpec.describe Awsrm::AlbTargetGroup do
  before(:each) do
    require 'stub/alb_target_group'
  end

  it '#one().id' do
    expect(Awsrm::AlbTargetGroup.one(id: 'my-alb-target-group').id).to eq 'my-alb-target-group'
    expect(Awsrm::AlbTargetGroup.one(arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:123456789012:targetgroup/73e2d6bc24d8a067/73e2d6bc24d8a067').id).to eq 'my-alb-target-group'
    expect(Awsrm::AlbTargetGroup.one(name: 'my-alb-target-group').id).to eq 'my-alb-target-group'
    expect(Awsrm::AlbTargetGroup.one(vpc: 'my-vpc').id).to eq 'my-alb-target-group'
  end

  it '#one().* access Aws::ElasticLoadBalancingV2::Types::TargetGroup' do
    expect(Awsrm::AlbTargetGroup.one(name: 'my-alb-target-group').port).to eq 80
  end
end
