# Resources

[Awsrm::AutoscalingGroup](#autoscaling_group)
| [Awsrm::Ec2](#ec2)
| [Awsrm::RouteTable](#route_table)
| [Awsrm::Subnet](#subnet)
| [Awsrm::Vpc](#vpc)

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


