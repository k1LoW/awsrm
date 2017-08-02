require 'spec_helper'

# rubocop:disable Metrics/LineLength
RSpec.describe Awsrm::AlbListener do
  before(:each) do
    require 'stub/alb'
  end

  it '#one().id' do
    expect(Awsrm::AlbListener.one(id: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:listener/app/my-alb/1aa1bb1cc1ddee11/f2f7dc8efc522ab2').id).to eq 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:listener/app/my-alb/1aa1bb1cc1ddee11/f2f7dc8efc522ab2'
    expect(Awsrm::AlbListener.one(arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:listener/app/my-alb/1aa1bb1cc1ddee11/f2f7dc8efc522ab2').id).to eq 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:listener/app/my-alb/1aa1bb1cc1ddee11/f2f7dc8efc522ab2'
    expect(Awsrm::AlbListener.one(alb: 'my-alb').id).to eq 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:listener/app/my-alb/1aa1bb1cc1ddee11/f2f7dc8efc522ab2'
  end

  it '#one().* access Aws::ElasticLoadBalancingV2::Types::LoadBalancer' do
    expect(Awsrm::AlbListener.one(arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:listener/app/my-alb/1aa1bb1cc1ddee11/f2f7dc8efc522ab2').port).to eq 80
  end
end
