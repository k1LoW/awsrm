module Awsrm
  class RouteTable < Awsrm::Resource
    FILTER_MAP = {
      name: 'tag:Name',
      vpc_id: 'vpc-id',
      vpc: ->(value) { { name: 'vpc-id', values: [Awsrm::Vpc.one(name: value).id] } }
    }.freeze

    class << self
      def one(params)
        res = ec2_client.describe_route_tables(
          filters: filters(params)
        )
        raise Awsrm::NoResourceError, "No resource #{name} by #{params}" if res.route_tables.count == 0
        raise Awsrm::DuplicatedResourceError, "Duplicated resource #{name} by #{params}" if res.route_tables.count > 1
        RouteTableReader.new(res.route_tables.first)
      end

      def all(params)
        res = ec2_client.describe_route_tables(
          filters: filters(params)
        )
        res.route_tables.map do |route|
          RouteTableReader.new(route)
        end
      end
    end
  end

  class RouteTableReader < Awsrm::ResourceReader
    def id
      @resource.route_table_id
    end
  end
end
