module Awsrm
  class SecurityGroup < Awsrm::Resource
    FILTER_MAP = {
      id: 'group-id',
      name: 'tag:Name',
      cidr: 'cidrBlock',
      vpc_id: 'vpc-id',
      vpc: ->(value) { { name: 'vpc-id', values: [Awsrm::Vpc.one(name: value).id] } }
    }.freeze

    class << self
      def all(params)
        res = ec2_client.describe_security_groups(
          filters: filters(params)
        )
        res.security_groups.map do |sg|
          SecurityGroupReader.new(sg)
        end
      end
    end
  end

  class SecurityGroupReader < Awsrm::ResourceReader
    def id
      @resource.group_id
    end
  end
end
