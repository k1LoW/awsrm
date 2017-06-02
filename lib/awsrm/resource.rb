require 'aws-sdk'

module Awsrm
  class Resource
    FILTER_MAP = {
      name: 'tag:Name'
    }.freeze

    class << self
      CLIENTS = {
        ec2_client: Aws::EC2::Client,
        ecr_client: Aws::ECR::Client,
        ecs_client: Aws::ECS::Client,
        efs_client: Aws::EFS::Client,
        rds_client: Aws::RDS::Client,
        route53_client: Aws::Route53::Client,
        s3_client: Aws::S3::Client,
        autoscaling_client: Aws::AutoScaling::Client,
        elb_client: Aws::ElasticLoadBalancing::Client,
        elbv2_client: Aws::ElasticLoadBalancingV2::Client,
        lambda_client: Aws::Lambda::Client,
        iam_client: Aws::IAM::Client,
        kms_client: Aws::KMS::Client,
        elasticache_client: Aws::ElastiCache::Client,
        cloudwatch_client: Aws::CloudWatch::Client,
        cloudwatch_event_client: Aws::CloudWatchEvents::Client,
        ses_client: Aws::SES::Client,
        directconnect_client: Aws::DirectConnect::Client,
        cloudfront_client: Aws::CloudFront::Client,
        elastictranscoder_client: Aws::ElasticTranscoder::Client,
        elasticsearch_client: Aws::ElasticsearchService::Client,
        cloudtrail_client: Aws::CloudTrail::Client,
        waf_client: Aws::WAF::Client,
        sts_client: Aws::STS::Client,
        acm_client: Aws::ACM::Client,
        cloudwatch_logs_client: Aws::CloudWatchLogs::Client,
        dynamodb_client: Aws::DynamoDB::Client
      }.freeze

      CLIENT_OPTIONS = {
        http_proxy: ENV['http_proxy'] || ENV['https_proxy'] || nil
      }.freeze

      def one(params)
        res = all(params)
        res.first if check_one(res)
      end

      def all(_params)
        raise 'not implemented'
      end

      def filters(params)
        params.map do |key, value|
          raise UndefinedFilterParamError, key unless self::FILTER_MAP.key?(key)
          next self::FILTER_MAP[key].call(value) if self::FILTER_MAP[key].is_a?(Proc)
          { name: self::FILTER_MAP[key], values: [value] }
        end
      end

      def check_one(resources)
        raise Awsrm::NoResourceError, "No resource #{name} by #{params}" if resources.count == 0
        raise Awsrm::DuplicatedResourceError, "Duplicated resource #{name} by #{params}" if resources.count > 1
        true
      end

      CLIENTS.each do |method_name, client|
        define_method method_name do
          client.new(CLIENT_OPTIONS)
        end
      end
    end
  end

  class ResourceReader
    def initialize(resource)
      @resource = resource
    end

    def id
      raise 'not implemented'
    end

    def arn
      raise 'not implemented'
    end

    def method_missing(key)
      @resource.send(key)
    end

    def respond_to?(key, *args)
      @resource.respond_to?(key) || super
    end
  end
end
