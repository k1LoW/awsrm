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
        raise Awsrm::NoResourceError, "No resource route_table by #{params}" if res.vpcs.count == 0
        raise Awsrm::DuplicatedResourceError, "Duplicated resource route_table by #{params}" if res.vpcs.count > 1
        VpcReader.new(res.vpcs.first)
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
      @struct.vpc_id
    end
  end
end
