module Awsrm
  class Alb < Awsrm::Resource
    FILTER_MAP = {
      id: 'load_balancer_name',
      arn: 'load_balancer_arn',
      name: 'load_balancer_name',
      dns_name: 'dns_name'
    }.freeze

    class << self
      def all(params)
        lbs = elbv2_client.describe_load_balancers.map do |responce|
          responce.load_balancers
        end.flatten
        lbs.map do |lb|
          ret = params.all? do |key, value|
            raise UndefinedFilterParamError, key unless self::FILTER_MAP.key?(key)
            lb[self::FILTER_MAP[key]] == value
          end
          AlbReader.new(lb) if ret
        end.compact
      end

      def filters(params) end
    end
  end

  class AlbReader < Awsrm::ResourceReader
    def id
      @resource.load_balancer_name
    end
  end
end
