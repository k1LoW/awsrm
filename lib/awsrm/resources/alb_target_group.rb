module Awsrm
  class AlbTargetGroup < Awsrm::Resource
    FILTER_MAP = {
      id: 'target_group_name',
      arn: 'target_group_arn',
      name: 'target_group_name',
      alb: ->(target, value) { target.load_balancer_arns.include?(Awsrm::Alb.one(name: value).load_balancer_arn) },
      vpc: ->(target, value) { target.vpc_id == Awsrm::Vpc.one(name: value).id }
    }.freeze

    class << self
      def all(params)
        target_groups = elbv2_client.describe_target_groups.map do |responce|
          responce.target_groups
        end.flatten
        target_groups.map do |target|
          ret = params.all? do |key, value|
            raise UndefinedFilterParamError, key unless self::FILTER_MAP.key?(key)
            next self::FILTER_MAP[key].call(target, value) if self::FILTER_MAP[key].is_a?(Proc)
            target[self::FILTER_MAP[key]] == value
          end
          AlbTargetGroupReader.new(target) if ret
        end.compact
      end

      def filters(_params)
        raise NoMethodError
      end
    end
  end

  class AlbTargetGroupReader < Awsrm::ResourceReader
    def id
      @resource.target_group_name
    end

    def instance_ids
      Awsrm::Resource.elbv2_client.describe_target_health(
        target_group_arn: @resource.target_group_arn
      ).target_health_descriptions.map do |desc|
        desc.target.id
      end
    end
  end
end
