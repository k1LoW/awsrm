module Awsrm
  class NetworkAcl < Awsrm::Resource
    FILTER_MAP = {
      id: 'network-acl-id',
      name: 'tag:Name',
      vpc_id: 'vpc-id',
      vpc: ->(value) { { name: 'vpc-id', values: [Awsrm::Vpc.one(name: value).id] } }
    }.freeze

    class << self
      def all(params)
        res = ec2_client.describe_network_acls(
          filters: filters(params)
        )
        res.network_acls.map do |route|
          NetworkAclReader.new(route)
        end
      end
    end
  end

  class NetworkAclReader < Awsrm::ResourceReader
    def id
      @resource.network_acl_id
    end
  end
end
