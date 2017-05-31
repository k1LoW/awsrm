module Awsrm
  class AutoscallingGroup < Awsrm::Resource
    FILTER_MAP = {
      name: ->(value) { [value] },
      tags: ->(value) { AutoscallingGroup.tags2names(value) }
    }.freeze
    class << self
      def one(params)
        res = autoscaling_client.describe_auto_scaling_groups(
          auto_scaling_group_names: filters(params)
        )
        raise Awsrm::NoResourceError, "No resource autoscaling_group by #{params}" if res.auto_scaling_groups.count == 0
        raise Awsrm::DuplicatedResourceError, "Duplicated resource autoscaling_group by #{params}" if res.auto_scaling_groups.count > 1
        AutoscallingGroupReader.new(res.auto_scaling_groups.first)
      end

      def all(params)
        res = autoscaling_client.describe_auto_scaling_groups(
          auto_scaling_group_names: filters(params)
        )
        res.auto_scaling_groups.map do |as|
          AutoscallingGroupReader.new(as)
        end
      end

      def filters(params)
        params.map do |key, value|
          raise UndefinedFilterParamError, key unless self::FILTER_MAP.key?(key)
          next self::FILTER_MAP[key].call(value) if self::FILTER_MAP[key].is_a?(Proc)
        end.flatten.uniq
      end

      def tags2names(tag_hash)
        tags = autoscaling_client.describe_tags.tags.flatten
        maps = tag_hash.map do |key, value|
          tags.map do |tag|
            tag.resource_id if tag.key == key.to_s && tag.value == value.to_s
          end.compact
        end
        maps.reduce do |memo, item|
          memo & item
        end
      end
    end

    class AutoscallingGroupReader < Awsrm::ResourceReader
      def id
        @resource.auto_scaling_group_name
      end

      def arn
        @resource.auto_scaling_group_arn
      end
    end
  end
end
