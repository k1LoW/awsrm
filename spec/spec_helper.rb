require 'pp'
require 'bundler/setup'
require 'awspec'
require 'awsrm'
require 'awsrm/generator/doc/resource'
require 'active_support/inflector'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Aws.config[:stub_responses] = true
Aws.config.update(
  region: 'us-east-1',
  credentials: Aws::Credentials.new(
    'akid',
    'secret'
  )
)
