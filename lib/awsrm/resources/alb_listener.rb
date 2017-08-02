module Awsrm
  class AlbListener < Awsrm::Resource
    FILTER_MAP = {
      id: 'listener_arn',
      arn: 'listener_arn',
      alb: ->(listener, value) { listener.load_balancer_arn == Awsrm::Alb.one(name: value).load_balancer_arn }
    }.freeze

    class << self
      def all(params)
        listeners = elbv2_client.describe_listeners.map do |responce|
          responce.listeners
        end.flatten
        listeners.map do |listener|
          ret = params.all? do |key, value|
            raise UndefinedFilterParamError, key unless self::FILTER_MAP.key?(key)
            next self::FILTER_MAP[key].call(listener, value) if self::FILTER_MAP[key].is_a?(Proc)
            listener[self::FILTER_MAP[key]] == value
          end
          AlbListenerReader.new(listener) if ret
        end.compact
      end

      def filters(params) end
    end
  end

  class AlbListenerReader < Awsrm::ResourceReader
    def id
      @resource.listener_arn
    end
  end
end
