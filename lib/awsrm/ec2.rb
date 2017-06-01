module Awsrm
  class Ec2 < Awsrm::Resource
    FILTER_MAP = {
      name: 'tag:Name',
      vpc_id: 'vpc-id',
      vpc: ->(value) { { name: 'vpc-id', values: [Awsrm::Vpc.one(name: value).id] } }
    }.freeze

    class << self
      def all(params)
        res = ec2_client.describe_instances(
          filters: filters(params)
        )
        res.reservations.map do |reservation|
          reservation.instances.map do |instance|
            Ec2Reader.new(instance)
          end
        end.flatten
      end
    end
  end

  class Ec2Reader < Awsrm::ResourceReader
    def id
      @resource.instance_id
    end
  end
end
