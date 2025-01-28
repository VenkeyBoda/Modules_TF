
# Terraform Module: Azure Linux Virtual Machine with Network Interface

This Terraform module creates an Azure Linux virtual machine with a network interface, associated Network Security Group (NSG), and public IP. Additionally, it executes a script on the virtual machine after creation.

## Usage

### Example

```hcl
module "azure_vm" {
  source = "path_to_your_module"

  # Resource group name
  resource_group = "my-resource-group"
  
  # Azure location (e.g., "East US")
  location = "East US"
  
  # Network Interface IDs
  nic_id = [
    "nic-id-1",
    "nic-id-2"
  ]
  
  # Number of VMs to create
  vm_count = 2
  
  # Virtual machine base name
  virtual_machine_name = "my-vm"
  
  # Admin username
  username = "azureuser"
  
  # Path to the SSH public key for admin access
  public_key_path = "./path/to/your/public_key.pub"
  
  # VM size (e.g., "Standard_B1s")
  vm_size = "Standard_B1s"
  
  # Path to the private key for SSH access to VM
  web_private_key = "./path/to/your/private_key"
  
  # Image publisher (e.g., "Canonical")
  vm_publisher = "Canonical"
  
  # Offer for the VM image (e.g., "UbuntuServer")
  offer_image = "UbuntuServer"
  
  # SKU for the image (e.g., "20.04-LTS")
  image_sku = "20.04-LTS"
  
  # Image version (e.g., "latest")
  image_version = "latest"
  
  # Build ID (e.g., "1")
  build_id = "1"
  
  # Path to the script to run after provisioning
  script = "./path/to/your/script.sh"
}
```

## Inputs

| Name                 | Description                                        | Type           | Default         | Required |
|----------------------|----------------------------------------------------|----------------|-----------------|----------|
| `resource_group`      | Name of the resource group                        | `string`       | N/A             | Yes      |
| `location`            | Location for the virtual network                  | `string`       | N/A             | Yes      |
| `nic_id`              | List of Network Interface IDs                     | `list(string)` | N/A             | Yes      |
| `vm_count`            | Number of virtual machines to create              | `number`       | N/A             | Yes      |
| `virtual_machine_name`| Base name for the virtual machines                | `string`       | N/A             | Yes      |
| `username`            | Admin username for SSH access to the VM          | `string`       | N/A             | Yes      |
| `public_key_path`     | Path to the public key for SSH access            | `string`       | N/A             | Yes      |
| `vm_size`             | Size of the virtual machine (e.g., "Standard_B1s")| `string`       | `Standard_B1s`  | No       |
| `web_private_key`     | Path to the private key for SSH access           | `string`       | N/A             | Yes      |
| `vm_publisher`        | VM image publisher (e.g., "Canonical")            | `string`       | N/A             | Yes      |
| `offer_image`         | VM image offer (e.g., "UbuntuServer")             | `string`       | N/A             | Yes      |
| `image_sku`           | SKU for the VM image (e.g., "20.04-LTS")          | `string`       | N/A             | Yes      |
| `image_version`       | Version of the VM image (e.g., "latest")         | `string`       | N/A             | Yes      |
| `build_id`            | Build identifier to trigger the null resource    | `string`       | `1`             | No       |
| `script`              | Path to the shell script to run after provisioning| `string`       | N/A             | Yes      |

## Outputs

| Name               | Description                                                   |
|--------------------|---------------------------------------------------------------|
| `vm_id`            | The ID of the first virtual machine created.                  |
| `url`              | List of VM URLs with their public IPs.                        |
| `ssh`              | List of SSH commands to access each VM using the private key.|
| `deploy_server`    | URL to access the first virtual machine for deployment tasks.|

## Description

This Terraform module creates a set of Linux virtual machines in Azure with the following features:
- A network interface associated with the VM.
- A Network Security Group (NSG) and a public IP for external access.
- SSH access enabled using a specified public/private key pair.
- Option to specify an image from the Azure marketplace (e.g., Ubuntu).

The module also includes provisioning capabilities via `remote-exec`, running a custom shell script on the VMs once they are up and running.

## Running the Module

1. **Prepare your Terraform configuration**: Include the module in your configuration as shown in the usage example above.
2. **Initialize the working directory**:
   ```bash
   terraform init
   ```
3. **Plan the deployment**:
   ```bash
   terraform plan
   ```
4. **Apply the configuration**:
   ```bash
   terraform apply
   ```
   This will create the resources and output the necessary values such as VM URLs and SSH access commands.

## Notes

- Ensure that your `nic_id` values correspond to valid network interfaces within the specified Azure subscription and resource group.
- The `script` input should be the path to a shell script that will be executed on each VM after it is created.
- The `build_id` input is used as a trigger for the null resource. This can be adjusted if needed.