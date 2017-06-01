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
| name | `#<Proc>` |
| tags | `#<Proc>` |


## <a name="ec2">Awsrm::Ec2</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |
| vpc_id | `vpc-id` |
| vpc | `#<Proc>` |


## <a name="route_table">Awsrm::RouteTable</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |
| vpc_id | `vpc-id` |
| vpc | `#<Proc>` |


## <a name="subnet">Awsrm::Subnet</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |
| cidr | `cidrBlock` |
| vpc_id | `vpc-id` |
| vpc | `#<Proc>` |


## <a name="vpc">Awsrm::Vpc</a>

### Filter

| key | replaced filter |
| - | - |
| name | `tag:Name` |


