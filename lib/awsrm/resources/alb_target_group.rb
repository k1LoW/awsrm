module Awsrm
  class AlbTargetGroup < Awsrm::Resource
    FILTER_MAP = {
      id: 'target_group_name',
      arn: 'target_group_arn',
      name: 'target_group_name',
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

      def filters(params) end
    end
  end

  class AlbTargetGroupReader < Awsrm::ResourceReader
    def id
      @resource.target_group_name
    end
  end
end
