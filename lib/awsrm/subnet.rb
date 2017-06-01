module Awsrm
  class Subnet < Awsrm::Resource
    FILTER_MAP = {
      name: 'tag:Name',
      cidr: 'cidrBlock',
      vpc_id: 'vpc-id',
      vpc: ->(value) { { name: 'vpc-id', values: [Awsrm::Vpc.one(name: value).id] } }
    }.freeze

    class << self
      def all(params)
        res = ec2_client.describe_subnets(
          filters: filters(params)
        )
        res.subnets.map do |route|
          SubnetReader.new(route)
        end
      end
    end
  end

  class SubnetReader < Awsrm::ResourceReader
    def id
      @resource.subnet_id
    end
  end
end
