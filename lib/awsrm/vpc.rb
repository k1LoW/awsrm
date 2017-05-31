module Awsrm
  class Vpc < Awsrm::Resource
    FILTER_MAP = {
      name: 'tag:Name'
    }.freeze

    class << self
      def one(params)
        res = ec2_client.describe_vpcs(
          filters: filters(params)
        )
        VpcReader.new(res.vpcs.first) if check_one(res.vpcs)
      end

      def all(params)
        res = ec2_client.describe_vpcs(
          filters: filters(params)
        )
        res.vpc.map do |route|
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
