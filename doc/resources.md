# Resources

[AutoscalingGroup](#autoscaling_group)
| [Ec2](#ec2)
| [RouteTable](#route_table)
| [Subnet](#subnet)
| [Vpc](#vpc)

## <a name="autoscaling_group">Awsrm::AutoscalingGroup</a>

### Filter

| key | replaced filter |
| - | - |
| name | `[#<Proc>](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/autoscaling_group.rb)` |
| tags | `[#<Proc>](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/autoscaling_group.rb)` |


## <a name="ec2">Awsrm::Ec2</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |
| vpc_id | `vpc-id` |
| vpc | `[#<Proc>](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/ec2.rb)` |


## <a name="route_table">Awsrm::RouteTable</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |
| vpc_id | `vpc-id` |
| vpc | `[#<Proc>](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/route_table.rb)` |


## <a name="subnet">Awsrm::Subnet</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |
| cidr | `cidrBlock` |
| vpc_id | `vpc-id` |
| vpc | `[#<Proc>](https://github.com/k1LoW/awsrm/blob/master/lib/awsrm/resources/subnet.rb)` |


## <a name="vpc">Awsrm::Vpc</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |


