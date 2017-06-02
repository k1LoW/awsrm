require 'spec_helper'

RSpec.describe Awsrm::Generator::Doc::Resource do
  it 'generate_doc output should be the same as doc/resources.md' do
    generated = Awsrm::Generator::Doc::Resource.generate_doc
    doc = File.read(File.dirname(__FILE__) + '/../../../doc/resources.md')
    expect(generated).to eq doc
  end
end
