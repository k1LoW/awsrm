module Awsrm
  class VpnConnection < Awsrm::Resource
    FILTER_MAP = {
      name: 'tag:Name'
    }.freeze

    class << self
      def all(params)
        res = ec2_client.describe_vpn_connections(
          filters: filters(params)
        )
        res.vpn_connections.map do |conn|
          VpnConnectionReader.new(conn)
        end
      end
    end
  end

  class VpnConnectionReader < Awsrm::ResourceReader
    def id
      @resource.vpn_connection_id
    end
  end
end
