# VPC Virtual Server instance

Module to provision a Virtual Server Instance (VSI) within an existing Virtual Private Cloud instance. The VSI can optionally be configured with Flow Logs to satisfy requirements imposed by security contraints.

**Note:** This module follows the Terraform conventions regarding how provider configuration is defined within the Terraform template and passed into the module - https://www.terraform.io/docs/language/modules/develop/providers.html. The default provider configuration flows through to the module. If different configuration is required for a module, it can be explicitly passed in the `providers` block of the module - https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v13

### Terraform providers

- IBM Cloud provider >= 1.23.0

## Module dependencies

## Example usage

```hcl-terraform
terraform {
  required_providers {
    ibm = {
      source = "ibm-cloud/ibm"
    }
  }
  required_version = ">= 0.13"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

module "vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-vsi.git"

  resource_group_id = module.resource_group.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  vpc_name          = module.vpc.name
  vpc_subnet_count  = module.subnets.count
  vpc_subnets       = module.subnets.subnets
  ssh_key_ids       = [module.vpcssh.id]
  flow_log_cos_bucket_name = module.dev_cos_bucket.bucket_name
}
```
