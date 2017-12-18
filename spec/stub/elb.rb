Aws.config[:elasticloadbalancing] = {
  stub_responses: {
    describe_load_balancers: {
      load_balancer_descriptions: [
        {
          load_balancer_name: 'my-elb',
          subnets: [
            'subnet-1234a567'
          ],
          instances: [
            {
              instance_id: 'i-ec12345a'
            },
            {
              instance_id: 'i-ec789dsa'
            }
          ],
          health_check: {
            target: 'HTTP:80/index.php',
            interval: 60,
            timeout: 5,
            unhealthy_threshold: 10,
            healthy_threshold: 2
          },
          security_groups: [
            'sg-5a2b3cd4'
          ],
          policies: {},
          source_security_group: {},
          listener_descriptions: [
            {
              listener: {
                protocol: 'HTTPS',
                load_balancer_port: 443,
                instance_protocol: 'HTTP',
                instance_port: 80
              }
            }
          ],
          dns_name: 'internal-my-elb-1551266724.ap-northeast-1.elb.amazonaws.com',
          vpc_id: 'vpc-ab123cde'
        }
      ]
    },
    describe_tags: {
      tag_descriptions: [
        {
          load_balancer_name: 'my-elb',
          tags: [
            {
              key: 'Dept',
              value: 'Research'
            },
            {
              key: 'Role',
              value: 'WebServer'
            }
          ]
        },
        {
          load_balancer_name: 'other-elb',
          tags: [
            {
              key: 'project',
              value: 'lima'
            },
            {
              key: 'department',
              value: 'digital-media'
            }
          ]
        }
      ]
    }
  }
}
