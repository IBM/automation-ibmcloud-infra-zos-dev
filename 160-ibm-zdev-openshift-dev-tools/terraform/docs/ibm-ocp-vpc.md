# IBM OpenShift VPC cluster module

Provisions an IBM Cloud OCP cluster


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- ibm (ibm-cloud/ibm)
- clis (cloud-native-toolkit/clis)

### Module dependencies


- resource-group - [github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group) (>= 1.0.0)
- cos - [github.com/cloud-native-toolkit/terraform-ibm-object-storage](https://github.com/cloud-native-toolkit/terraform-ibm-object-storage) (>= 2.1.0)
- subnets - [github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-subnets](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-subnets) (>= 1.8.0)
- kms_key - [github.com/terraform-ibm-modules/terraform-ibm-toolkit-kms-key](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-kms-key) (>= 1.0.0)
- sync - interface github.com/cloud-native-toolkit/automation-modules#sync

## Example usage

```hcl
module "cluster" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-ocp-vpc"

  common_tags = var.common_tags == null ? null : jsondecode(var.common_tags)
  cos_id = var.cluster_cos_id
  disable_public_endpoint = var.cluster_disable_public_endpoint
  exists = var.cluster_exists
  flavor = var.cluster_flavor
  force_delete_storage = var.cluster_force_delete_storage
  ibmcloud_api_key = var.ibmcloud_api_key
  kms_enabled = var.cluster_kms_enabled
  kms_id = var.cluster_kms_id
  kms_key_id = var.cluster_kms_key_id
  kms_private_endpoint = var.cluster_kms_private_endpoint
  login = var.cluster_login
  name = var.cluster_name
  name_prefix = var.name_prefix
  ocp_entitlement = var.cluster_ocp_entitlement
  ocp_version = var.ocp_version
  region = var.region
  resource_group_name = module.resource_group.name
  sync = module.resource_group.sync
  tags = var.cluster_tags == null ? null : jsondecode(var.cluster_tags)
  vpc_name = var.cluster_vpc_name
  vpc_subnet_count = var.cluster_vpc_subnet_count
  vpc_subnets = var.cluster_vpc_subnets == null ? null : jsondecode(var.cluster_vpc_subnets)
  worker_count = var.worker_count
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| resource_group_name | The name of the IBM Cloud resource group where the cluster will be created/can be found. | true |  | resource-group.name |
| region | The IBM Cloud region where the cluster will be/has been installed. | true |  |  |
| ibmcloud_api_key | The IBM Cloud api token | true |  |  |
| name | The name of the cluster that will be created within the resource group | true |  |  |
| worker_count | The number of worker nodes that should be provisioned for classic infrastructure | false | 3 |  |
| flavor | The machine type that will be provisioned for classic infrastructure | false | bx2.4x16 |  |
| ocp_version | The version of the OpenShift cluster that should be provisioned (format 4.x) | false | 4.10 |  |
| exists | Flag indicating if the cluster already exists (true or false) | true |  |  |
| disable_public_endpoint | Flag indicating that the public endpoint should be disabled | true |  |  |
| name_prefix | The prefix name for the service. If not provided it will default to the resource group name | true |  |  |
| ocp_entitlement | Value that is applied to the entitlements for OCP cluster provisioning | false | cloud_pak |  |
| force_delete_storage | Attribute to force the removal of persistent storage associtated with the cluster | true |  |  |
| tags | Tags that should be added to the instance | false |  |  |
| vpc_name | Name of the VPC instance that will be used | true |  | subnets.vpc_name |
| vpc_subnet_count | Number of vpc subnets | true |  | subnets.count |
| vpc_subnets | List of subnets with labels | true |  | subnets.subnets |
| cos_id | The crn of the COS instance that will be used with the OCP instance | true |  | cos.id |
| kms_enabled | Flag indicating that kms encryption should be enabled for this cluster | true |  |  |
| kms_id | The crn of the KMS instance that will be used to encrypt the cluster. | false | null | kms_key.kms_id |
| kms_key_id | The id of the root key in the KMS instance that will be used to encrypt the cluster. | false | null | kms_key.id |
| kms_private_endpoint | Flag indicating that the private endpoint should be used to connect the KMS system to the cluster. | false | true |  |
| login | Flag indicating that after the cluster is provisioned, the module should log into the cluster | true |  |  |
| sync | Value used to order dependencies | true |  | sync.sync |
| common_tags | Common tags that should be added to the instance | false |  |  |

### Outputs

| Name | Description |
|------|-------------|
| id | ID of the cluster. |
| name | Name of the cluster. |
| resource_group_name | Name of the resource group containing the cluster. |
| region | Region containing the cluster. |
| config_file_path | Path to the config file for the cluster. |
| platform | Configuration values for the cluster platform |
| sync | Value used to sync downstream modules |
| total_worker_count | The total number of workers for the cluster. (subnets * number of workers) |
| workers | List of objects containing data for all workers  |
| server_url | The url used to connect to the api server. If the cluster has public endpoints enabled this will be the public api server, otherwise this will be the private api server url |
| username | The username of the admin user for the cluster |
| password | The password of the admin user for the cluster |
| token | The admin user token used to generate the cluster |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.0.1)
