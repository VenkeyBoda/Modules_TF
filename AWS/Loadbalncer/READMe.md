
# AWS Load Balancer Terraform Module

This Terraform module creates an AWS Load Balancer, a target group, and listener configuration. It allows you to set up an Application Load Balancer (ALB) or Network Load Balancer (NLB), define health checks for the target instances, and attach those instances to the load balancer.

## Resources Managed
- **AWS Load Balancer (`aws_lb`)**
- **AWS Load Balancer Target Group (`aws_lb_target_group`)**
- **AWS Load Balancer Target Group Attachment (`aws_lb_target_group_attachment`)**
- **AWS Load Balancer Listener (`aws_lb_listener`)**

## Requirements
- Terraform version 1.0 or higher.
- AWS account with necessary permissions to create Load Balancer, Target Groups, and related resources.

## Usage

To use this module, you must declare it within your Terraform configuration as follows:

```hcl
module "load_balancer" {
  source = "path/to/this/module"

  aws_lb_name                = "my-load-balancer"
  aws_lb_internal            = false
  aws_lb_type                = "application"
  subnets_id                 = ["subnet-abc123", "subnet-def456"]
  enable_deletion_protection = true
  lb_environment             = "production"
  lb_port                    = 80
  lb_protocol                = "HTTP"
  lb_health_check            = {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 6
    interval            = 10
  }
  target_instance_ids        = ["i-0abcd1234efgh5678", "i-0ijkl2345mnop6789"]
  listener_type              = "forward"
  vpc_id                     = "vpc-xyz987"
}
```

## Inputs

| Name                       | Description                                                                 | Type          | Default               | Required |
|----------------------------|-----------------------------------------------------------------------------|---------------|-----------------------|----------|
| `aws_lb_name`               | The name of the AWS Load Balancer.                                           | `string`      |                       | Yes      |
| `aws_lb_internal`           | Whether the Load Balancer is internal (true) or external (false).           | `bool`        | `false`               | No       |
| `aws_lb_type`               | Type of Load Balancer (e.g., `application`, `network`).                     | `string`      |                       | Yes      |
| `subnets_id`                | List of subnet IDs where the Load Balancer will be deployed.                | `list(string)`|                       | Yes      |
| `enable_deletion_protection`| Enables or disables deletion protection for the Load Balancer.              | `bool`        | `false`               | No       |
| `lb_environment`            | Environment designation for the Load Balancer (e.g., `production`, `staging`).| `string`     |                       | Yes      |
| `lb_port`                   | Port on which the Load Balancer will listen for traffic.                    | `number`      |                       | Yes      |
| `lb_protocol`               | Protocol used by the Load Balancer (e.g., `HTTP`, `HTTPS`, `TCP`).          | `string`      |                       | Yes      |
| `lb_health_check`           | Health check configuration for the Load Balancer (healthy/unhealthy thresholds, timeout, interval). | `map(string)` | `{ healthy_threshold = 2, unhealthy_threshold = 2, timeout = 5, interval = 6 }` | No       |
| `target_instance_ids`       | List of target instance IDs that the Load Balancer will route traffic to.   | `list(string)`|                       | Yes      |
| `listener_type`             | Type of listener for the Load Balancer (default is `forward`).              | `string`      | `forward`             | No       |
| `vpc_id`                    | VPC ID where the Load Balancer will be created.                             | `string`      |                       | Yes      |

## Outputs

| Name | Description |
|------|-------------|
| `url` | The URL of the Load Balancer (e.g., `http://<dns-name>`) |

## Example

Once the module is applied, you can access the Load Balancer via the URL output:

```hcl
output "lb_url" {
  value = module.load_balancer.url
}
```

This will provide the URL for accessing your Load Balancer.

## Notes
- Make sure that the target instances specified in `target_instance_ids` are reachable and configured correctly to handle traffic.
- Ensure the appropriate security group rules are in place for the Load Balancer and instances.
- Health checks are automatically configured based on the settings provided in the `lb_health_check` variable.


