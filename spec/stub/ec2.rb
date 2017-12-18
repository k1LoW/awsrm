Aws.config[:ec2] = {
  stub_responses: {
    describe_instances: {
      reservations: [
        {
          instances: [
            {
              instance_id: 'i-ec12345a',
              image_id: 'ami-abc12def',
              vpc_id: 'vpc-ab123cde',
              subnet_id: 'subnet-1234a567',
              public_ip_address: '123.0.456.789',
              private_ip_address: '10.0.1.1',
              instance_type: 't2.small',
              state: {
                name: 'running'
              },
              security_groups: [
                {
                  group_id: 'sg-1a2b3cd4',
                  group_name: 'my-security-group-name'
                }
              ],
              iam_instance_profile: {
                arn: 'arn:aws:iam::123456789012:instance-profile/Ec2IamProfileName',
                id: 'ABCDEFGHIJKLMNOPQRSTU'
              },
              block_device_mappings: [
                {
                  device_name: '/dev/sda',
                  ebs: {
                    volume_id: 'vol-123a123b'
                  }
                }
              ],
              network_interfaces: [
                {
                  network_interface_id: 'eni-12ab3cde',
                  subnet_id: 'subnet-1234a567',
                  vpc_id: 'vpc-ab123cde',
                  attachment: {
                    device_index: 1
                  }
                }
              ],
              tags: [
                {
                  key: 'Name',
                  value: 'my-ec2'
                }
              ]
            }
          ]
        }
      ]
    },
    describe_instance_attribute: {
      instance_id: 'i-ec12345a',
      disable_api_termination: {
        value: true
      }
    },
    describe_instance_status: {
      instance_statuses: [
        {
          instance_id: 'i-ec12345a',
          availability_zone: 'ap-northeast-1c',
          events: [
            {
              code: 'system-reboot',
              description: 'scheduled reboot'
            }
          ],
          instance_state: {
            name: 'running'
          },
          system_status: {
            status: 'ok'
          },
          instance_status: {
            status: 'ok'
          }
        }
      ]
    },
    describe_vpcs: {
      vpcs: [
        {
          vpc_id: 'vpc-ab123cde',
          tags: [
            {
              key: 'Name',
              value: 'my-vpc'
            }
          ]
        }
      ]
    },
    describe_subnets: {
      subnets: [
        {
          state: 'available',
          vpc_id: 'vpc-ab123cde',
          subnet_id: 'subnet-1234a567',
          cidr_block: '10.0.1.0/24',
          tags: [
            {
              key: 'Name',
              value: 'my-subnet'
            }
          ]
        }
      ]
    },
    describe_addresses: {
      addresses: [
        {
          public_ip: '123.0.456.789',
          instance_id: 'i-ec12345a'
        }
      ]
    },
    describe_security_groups: {
      security_groups: [
        {
          group_id: 'sg-1a2b3cd4',
          group_name: 'my-security-group-name',
          tags: [
            {
              key: 'Name',
              value: 'my-security-group-tag-name'
            }
          ]
        }
      ]
    },
    describe_volumes: {
      volumes: [
        {
          volume_id: 'vpc-ab123cde',
          state: 'in-use',
          size: 100,
          attachments: [
            {
              instance_id: 'i-ec12345a',
              volume_id: 'vpc-ab123cde',
              state: 'attached'
            }
          ],
          tags: [
            {
              key: 'Name',
              value: 'my-volume'
            }
          ]
        }
      ]
    },
    describe_classic_link_instances: {
      instances: [
        instance_id: 'my-ec2-classic',
        vpc_id: 'my-vpc',
        groups: [
          { group_name: nil, group_id: 'sg-2a3b4cd5' },
          { group_name: 'my-vpc-security-group-name', group_id: nil }
        ]
      ]
    },
    describe_network_interfaces: {
      network_interfaces: [
        {
          network_interface_id: 'eni-12ab3cde',
          subnet_id: 'subnet-1234a567',
          vpc_id: 'vpc-ab123cde',
          availability_zone: 'ap-northeast-1c',
          description: '',
          owner_id: '1234567890',
          requester_id: nil,
          requester_managed: false,
          status: 'in-use',
          mac_address: '00:11:aa:bb:cc:22',
          private_ip_address: '10.0.1.1',
          private_dns_name: nil,
          source_dest_check: true,
          groups:
            [
              {
                group_name: 'my-security-group-name',
                group_id: 'sg-1a2b3cd4'
              }
            ],
          attachment: {
            attachment_id: 'eni-attach-12ab3cde',
            instance_id: 'i-ec12345a',
            instance_owner_id: '1234567890',
            device_index: 0,
            status: 'attached',
            attach_time: nil,
            delete_on_termination: true
          },
          association: nil,
          tag_set: [
            {
              key: 'Name',
              value: 'my-eni'
            }
          ],
          private_ip_addresses: [
            {
              private_ip_address: '10.0.1.1',
              private_dns_name: nil,
              primary: true,
              association: nil
            },
            {
              private_ip_address: '10.0.1.2',
              private_dns_name: '',
              primary: false,
              association: nil
            }
          ],
          interface_type: nil
        }
      ]
    }
  }
}

# rubocop:disable Metrics/LineLength
Aws.config[:elasticloadbalancingv2] = {
  stub_responses: {
    describe_load_balancers: {
      load_balancers: [
        {
          load_balancer_arn:
            'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:loadbalancer/app/my-alb/1aa1bb1cc1ddee11',
          dns_name:
            'internal-my-elb-1551266724.ap-northeast-1.elb.amazonaws.com',
          canonical_hosted_zone_id: 'A12BCDEDCBA34BC',
          created_time: Time.new(2017, 4, 4, 9, 00, 00, '+00:00'),
          load_balancer_name: 'my-alb',
          scheme: 'internal',
          vpc_id: 'vpc-ab123cde',
          state:
            {
              code: 'active',
              reason: nil
            },
          type: 'application',
          availability_zones:
            [
              {
                zone_name: 'ap-northeast-1a',
                subnet_id: 'subnet-1234a567'
              },
              {
                zone_name: 'ap-northeast-1c',
                subnet_id: 'subnet-abcd7890'
              }
            ],
          security_groups: ['sg-1a2b3cd4'],
          ip_address_type: 'ipv4'
        }
      ],
      next_marker: nil
    },
    describe_listeners: {
      listeners: [
        {
          default_actions: [
            {
              target_group_arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:targetgroup/my-targets/73e2d6bc24d8a067',
              type: 'forward'
            }
          ],
          listener_arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:listener/app/my-alb/1aa1bb1cc1ddee11/f2f7dc8efc522ab2',
          load_balancer_arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:loadbalancer/app/my-alb/1aa1bb1cc1ddee11',
          port: 80,
          protocol: 'HTTP'
        }
      ]
    },
    describe_target_groups: {
      target_groups: [
        {
          health_check_interval_seconds: 30,
          health_check_path: '/',
          health_check_port: 'traffic-port',
          health_check_protocol: 'HTTP',
          health_check_timeout_seconds: 5,
          healthy_threshold_count: 5,
          load_balancer_arns: [
            'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:loadbalancer/app/my-alb/1aa1bb1cc1ddee11'
          ],
          matcher: {
            http_code: '200'
          },
          port: 80,
          protocol: 'HTTP',
          target_group_arn: 'arn:aws:elasticloadbalancing:ap-northeast-1:1234567890:123456789012:targetgroup/73e2d6bc24d8a067/73e2d6bc24d8a067',
          target_group_name: 'my-alb-target-group',
          unhealthy_threshold_count: 2,
          vpc_id: 'vpc-ab123cde'
        }
      ]
    },
    describe_target_health: {
      target_health_descriptions: [
        {
          target: {
            id: 'i-0f76fade',
            port: 80
          },
          target_health: {
            description: 'Given target group is not configured to receive traffic from ELB',
            reason: 'Target.NotInUse',
            state: 'unused'
          }
        },
        {
          health_check_port: '80',
          target: {
            id: 'i-ec12345a',
            port: 80
          },
          target_health: {
            state: 'healthy'
          }
        }
      ]
    }
  }
}
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
