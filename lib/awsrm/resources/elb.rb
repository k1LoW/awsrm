module Awsrm
  class Elb < Awsrm::Resource
    FILTER_MAP = {
      id: 'load_balancer_name',
      name: 'load_balancer_name',
      dns_name: 'dns_name',
      tags: ->(lb, value) { Elb.has_tags?(lb.load_balancer_name, value) },
      vpc: ->(lb, value) { lb.vpc_id == Awsrm::Vpc.one(name: value).id }
    }.freeze

    class << self
      def all(params)
        elbs = elb_client.describe_load_balancers.map do |responce|
          responce.load_balancer_descriptions
        end.flatten
        elbs.map do |lb|
          ret = params.all? do |key, value|
            raise UndefinedFilterParamError, key unless self::FILTER_MAP.key?(key)
            next self::FILTER_MAP[key].call(lb, value) if self::FILTER_MAP[key].is_a?(Proc)
            lb[self::FILTER_MAP[key]] == value
          end
          ElbReader.new(lb) if ret
        end.compact
      end

      def filters(_params)
        raise NoMethodError
      end

      def has_tags?(name, tag_hash)
        tag_descriptions = elb_client.describe_tags(load_balancer_names: [name]).tag_descriptions.flatten
        ret = tag_descriptions.find do |desc|
          desc.load_balancer_name == name
        end
        return false if ret.nil?
        tag_hash.all? do |key, value|
          ret.tags.any? do |tag|
            tag.key == key.to_s && tag.value == value.to_s
          end
        end
      end
    end
  end

  class ElbReader < Awsrm::ResourceReader
    def id
      @resource.load_balancer_name
    end
  end
end
