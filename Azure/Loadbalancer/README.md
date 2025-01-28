# Terraform Azure Load Balancer Module

This Terraform module provisions an Azure Load Balancer (Standard SKU) with a static public IP, backend address pool, health probe, and load balancing rules. It also allows associating multiple network interfaces to the backend pool.

---

## Features

- Creates a public IP address for the load balancer.
- Configures the load balancer with a frontend IP, backend address pool, health probe, and traffic distribution rules.
- Supports associating multiple network interfaces to the backend pool.
- Outputs the public IP address for easy access.

---

## Inputs

| Name                  | Description                                                                 | Type           | Default | Required |
|-----------------------|-----------------------------------------------------------------------------|----------------|---------|----------|
| `resource_group`      | The name of the resource group where the resources will be created.        | `string`       | n/a     | yes      |
| `location`            | The location (region) of the load balancer and other resources.            | `string`       | n/a     | yes      |
| `lb_name`             | The name of the load balancer.                                             | `string`       | n/a     | yes      |
| `frontend_ip_name`    | The name of the frontend IP configuration for the load balancer.           | `string`       | n/a     | yes      |
| `lb_backend_name`     | The name of the backend pool for the load balancer.                        | `string`       | n/a     | yes      |
| `nic_count`           | The number of network interfaces to associate with the load balancer.      | `number`       | n/a     | yes      |
| `nic_id`              | A list of network interface IDs to be associated with the load balancer.   | `list(string)` | n/a     | yes      |
| `lb_probe_name`       | The name of the health probe for the load balancer.                        | `string`       | n/a     | yes      |
| `lb_rule_name`        | The name of the load balancing rule to define traffic routing.             | `string`       | n/a     | yes      |

---

## Outputs

| Name                | Description                                      |
|---------------------|--------------------------------------------------|
| `public_ip_address` | The public IP address of the load balancer.      |

---

## Usage

```hcl
module "azure_lb" {
  source = "./path-to-your-module"

  resource_group      = "example-resource-group"
  location            = "East US"
  lb_name             = "my-load-balancer"
  frontend_ip_name    = "my-frontend-ip"
  lb_backend_name     = "my-backend-pool"
  nic_count           = 2
  nic_id              = ["/subscriptions/xxxx/resourceGroups/xxxx/providers/Microsoft.Network/networkInterfaces/nic1",
                         "/subscriptions/xxxx/resourceGroups/xxxx/providers/Microsoft.Network/networkInterfaces/nic2"]
  lb_probe_name       = "http-health-probe"
  lb_rule_name        = "http-rule"
}
```

---

## Example Output

After applying the module, you will get the following output:

```
public_ip_address = "http://<public-ip-address>"
```

Use this IP address to access the load balancer via HTTP.

---

## Notes

- Ensure that the network interfaces specified in `nic_id` are in the same region and resource group as the load balancer.
- Make sure the backend virtual machines are configured to serve traffic on the defined backend port (default: 80).

---

