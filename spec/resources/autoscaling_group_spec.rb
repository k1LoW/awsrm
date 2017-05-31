require 'spec_helper'

RSpec.describe Awsrm::AutoscallingGroup do
  before(:each) do
    require 'stub/autoscaling_group'
  end

  it '#one().id' do
    expect(Awsrm::AutoscallingGroup.one(name: 'my-auto-scaling-group').id).to eq 'my-auto-scaling-group'
  end

  it '#filters' do
    expect(Awsrm::AutoscallingGroup.filters(name: 'my-auto-scaling-group')).to eq ['my-auto-scaling-group']
    expect(Awsrm::AutoscallingGroup.filters(tags: { Dept: 'Research', Role: 'WebServer' })).to eq ['my-auto-scaling-group']
    expect(Awsrm::AutoscallingGroup.filters(tags: { Dept: 'Research', Invalid: 'Value' })).to eq []
  end
end
