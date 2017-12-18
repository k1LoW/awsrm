# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'awsrm/version'

Gem::Specification.new do |spec|
  spec.name          = 'awsrm'
  spec.version       = Awsrm::VERSION
  spec.authors       = ['k1LoW']
  spec.email         = ['k1lowxb@gmail.com']

  spec.summary       = 'Simple AWS Resource "READONLY" Mapper for awspec.'
  spec.description   = 'Simple AWS Resource "READONLY" Mapper for awspec.'
  spec.homepage      = 'https://github.com/k1LoW/awsrm'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1'
  spec.add_runtime_dependency 'aws-sdk', '>= 2.2', '< 4.0'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'awspec', '>= 0.80.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.0'
  spec.add_development_dependency 'octorelease'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'thor'
  spec.add_development_dependency 'activesupport'
end
