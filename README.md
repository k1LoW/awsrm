# awsrm [![Gem](https://img.shields.io/gem/v/awsrm.svg)](https://rubygems.org/gems/awsrm) [![Travis](https://img.shields.io/travis/k1LoW/awsrm.svg)](https://travis-ci.org/k1LoW/awsrm) 

Simple AWS Resource "READONLY" Mapper for awspec.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'awsrm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install awsrm

## Usage

### ::one

`Awsrm::Resource::one` identify uniquely one resource or raise error. this method not like ActiveRecord `find` .

- identify `1` resource -> return resource
- identify `0` resource -> raise error
- identify `>1` resources -> raise error

```ruby
require 'awspec'
require 'awsrm'

describe route_table(Awsrm::RouteTable.one(name: 'my-route-table', vpc: 'my-vpc').id) do
  it { should exist }
  it { should belong_to_vpc('my-vpc') }
end
```

### ::all

`Awsrm::Resource::all` return all resources.

- identify `0` resource -> return empty array
- identify `>1` resources -> return resources array

```ruby
require 'awspec'
require 'awsrm'

Awsrm::RouteTable.all(vpc: 'my-vpc').each do | route |
  describe route_table(route.id) do
    it { should exist }
    it { should belong_to_vpc('my-vpc') }
  end
end
```

## Support AWS Resources

[Resources](doc/resources.md)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

