module Awsrm
  class Vpc < Awsrm::Resource
    FILTER_MAP = {
      id: 'vpc-id',
      vpc_id: 'vpc-id',
      name: 'tag:Name'
    }.freeze

    class << self
      def all(params)
        res = ec2_client.describe_vpcs(
          filters: filters(params)
        )
        res.vpcs.map do |route|
          VpcReader.new(route)
        end
      end
    end
  end

  class VpcReader < Awsrm::ResourceReader
    def id
      @resource.vpc_id
    end
  end
end
