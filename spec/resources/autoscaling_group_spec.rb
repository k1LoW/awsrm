require 'spec_helper'

RSpec.describe Awsrm::AutoscalingGroup do
  before(:each) do
    require 'stub/autoscaling_group'
  end

  it '#one().id' do
    expect(Awsrm::AutoscalingGroup.one(name: 'my-auto-scaling-group').id).to eq 'my-auto-scaling-group'
  end

  it '#filters' do
    expect(Awsrm::AutoscalingGroup.filters(name: 'my-auto-scaling-group')).to eq ['my-auto-scaling-group']
    expect(Awsrm::AutoscalingGroup.filters(id: 'my-auto-scaling-group')).to eq ['my-auto-scaling-group']
    # rubocop:disable Metrics/LineLength
    expect(Awsrm::AutoscalingGroup.filters(arn: 'arn:aws:autoscaling:::autoScalingGroup::autoScalingGroupName/my-auto-scaling-group')).to eq ['my-auto-scaling-group']
    # rubocop:enable Metrics/LineLength
    expect(Awsrm::AutoscalingGroup.filters(
             tags: { Dept: 'Research', Role: 'WebServer' })).to eq ['my-auto-scaling-group']
    expect(Awsrm::AutoscalingGroup.filters(
             tags: { Dept: 'Research', Invalid: 'Value' })).to eq []
  end

  it '#one().* access Aws::AutoScaling::Types::AutoScalingGroup' do
    expect(Awsrm::AutoscalingGroup.one(name: 'my-auto-scaling-group').health_check_type).to eq 'EC2'
  end
end
