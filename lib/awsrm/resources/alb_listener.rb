module Awsrm
  class AlbListener < Awsrm::Resource
    FILTER_MAP = {
      id: 'listener_arn',
      arn: 'listener_arn',
      alb: ->(value) { { load_balancer_arn: Awsrm::Alb.one(name: value).load_balancer_arn } }
    }.freeze

    class << self
      def all(params)
        listeners = params.map do |key, value|
          raise UndefinedFilterParamError, key unless self::FILTER_MAP.key?(key)
          if self::FILTER_MAP[key].is_a?(Proc)
            next elbv2_client.describe_listeners(self::FILTER_MAP[key].call(value)).map do |responce|
              responce.listeners
            end.flatten
          end
          elbv2_client.describe_listeners(listener_arns: [value]).map do |responce|
            responce.listeners
          end.flatten
        end.flatten
        listeners.map do |listener|
          AlbListenerReader.new(listener)
        end
      end

      def filters(_params)
        raise NoMethodError
      end
    end
  end

  class AlbListenerReader < Awsrm::ResourceReader
    def id
      @resource.listener_arn
    end
  end
end
