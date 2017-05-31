# [UNDER DEVELOPMENT] awsrm

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

```ruby
require 'awspec'
require 'awsrm'

describe route_table(Awsrm::RouteTable.one(name: 'my-route-table', vpc: 'my-vpc').id) do
  it { should exist }
  it { should belong_to_vpc('my-vpc') }
end
```

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

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

