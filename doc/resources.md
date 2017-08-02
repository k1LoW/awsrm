# Resources

[Alb](#alb)
| [AutoscalingGroup](#autoscaling_group)
| [Ec2](#ec2)
| [RouteTable](#route_table)
| [Subnet](#subnet)
| [Vpc](#vpc)
| [VpnConnection](#vpn_connection)

## <a name="alb">Awsrm::Alb</a>

### Filter

| key | replaced filter |
| - | - |
| id | `load_balancer_name` |
| arn | `load_balancer_arn` |
| name | `load_balancer_name` |
| dns_name | `dns_name` |


## <a name="autoscaling_group">Awsrm::AutoscalingGroup</a>

### Filter

| key | replaced filter |
| - | - |
| id | [`#<Proc>`](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/autoscaling_group.rb) |
| arn | [`#<Proc>`](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/autoscaling_group.rb) |
| name | [`#<Proc>`](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/autoscaling_group.rb) |
| tags | [`#<Proc>`](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/autoscaling_group.rb) |


## <a name="ec2">Awsrm::Ec2</a>

### Filter

| key | replaced filter |
| - | - |
| id | `instance-id` |
| instance_id | `instance-id` |
| name | `tag:Name` |
| vpc_id | `vpc-id` |
| vpc | [`#<Proc>`](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/ec2.rb) |


## <a name="route_table">Awsrm::RouteTable</a>

### Filter

| key | replaced filter |
| - | - |
| id | `route-table-id` |
| route_table_id | `route-table-id` |
| name | `tag:Name` |
| vpc_id | `vpc-id` |
| vpc | [`#<Proc>`](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/route_table.rb) |


## <a name="subnet">Awsrm::Subnet</a>

### Filter

| key | replaced filter |
| - | - |
| id | `subnet-id` |
| subnet_id | `subnet-id` |
| name | `tag:Name` |
| cidr | `cidrBlock` |
| vpc_id | `vpc-id` |
| vpc | [`#<Proc>`](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/subnet.rb) |


## <a name="vpc">Awsrm::Vpc</a>

### Filter

| key | replaced filter |
| - | - |
| id | `vpc-id` |
| vpc_id | `vpc-id` |
| name | `tag:Name` |


## <a name="vpn_connection">Awsrm::VpnConnection</a>

### Filter

| key | replaced filter |
| - | - |
| id | `vpn-connection-id` |
| vpn_connection_id | `vpn-connection-id` |
| name | `tag:Name` |


