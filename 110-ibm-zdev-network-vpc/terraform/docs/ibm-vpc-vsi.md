# VPC VSI module

Module to provision virtual server instance


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- ibm (ibm-cloud/ibm)

### Module dependencies


- resource_group - [github.com/cloud-native-toolkit/terraform-ibm-resource-group](https://github.com/cloud-native-toolkit/terraform-ibm-resource-group) (>= 2.1.0)
- vpc - [github.com/cloud-native-toolkit/terraform-ibm-vpc](https://github.com/cloud-native-toolkit/terraform-ibm-vpc) (>= 1.11.3)
- subnets - [github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets](https://github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets) (>= 1.0.0)
- vpcssh - [github.com/cloud-native-toolkit/terraform-ibm-vpc-ssh](https://github.com/cloud-native-toolkit/terraform-ibm-vpc-ssh) (>= 1.0.0)
- kms_key - [github.com/cloud-native-toolkit/terraform-ibm-kms-key](https://github.com/cloud-native-toolkit/terraform-ibm-kms-key) (>= 0.0.1)

## Example usage

```hcl
module "ibm-vpc-vsi" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-vsi"

  acl_rules = var.ibm-vpc-vsi_acl_rules == null ? null : jsondecode(var.ibm-vpc-vsi_acl_rules)
  allow_deprecated_image = var.ibm-vpc-vsi_allow_deprecated_image
  allow_ssh_from = var.ibm-vpc-vsi_allow_ssh_from
  auto_delete_volume = var.ibm-vpc-vsi_auto_delete_volume
  base_security_group = module.ibm-vpc.base_security_group
  create_public_ip = var.ibm-vpc-vsi_create_public_ip
  ibmcloud_api_key = var.ibmcloud_api_key
  image_name = var.ibm-vpc-vsi_image_name
  init_script = var.ibm-vpc-vsi_init_script
  kms_enabled = var.ibm-vpc-vsi_kms_enabled
  kms_key_crn = module.kms-key.crn
  label = var.ibm-vpc-vsi_label
  profile_name = var.ibm-vpc-vsi_profile_name
  region = var.region
  resource_group_id = module.resource_group.id
  security_group_rules = var.ibm-vpc-vsi_security_group_rules == null ? null : jsondecode(var.ibm-vpc-vsi_security_group_rules)
  ssh_key_id = module.dev_ssh_vsi.id
  tags = var.ibm-vpc-vsi_tags == null ? null : jsondecode(var.ibm-vpc-vsi_tags)
  target_network_range = var.ibm-vpc-vsi_target_network_range
  vpc_name = module.ibm-vpc.name
  vpc_subnet_count = module.worker-subnets.count
  vpc_subnets = module.worker-subnets.subnets
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| resource_group_id | The id of the IBM Cloud resource group where the VPC has been provisioned. | true |  | resource_group.id |
| region | The IBM Cloud region where the cluster will be/has been installed. | true |  |  |
| ibmcloud_api_key | The IBM Cloud api token | true |  |  |
| vpc_name | The name of the vpc instance | true |  | vpc.name |
| label | The label for the server instance | false | server |  |
| image_name | The name of the image to use for the virtual server | false | ibm-ubuntu-18-04-6-minimal-amd64-3 |  |
| vpc_subnet_count | Number of vpc subnets | true |  | subnets.count |
| vpc_subnets | List of subnets with labels | true |  | subnets.subnets |
| profile_name | Instance profile to use for the bastion instance | false | cx2-2x4 |  |
| ssh_key_id | SSH key ID to inject into the virtual server instance | true |  | vpcssh.id |
| allow_ssh_from | An IP address, a CIDR block, or a single security group identifier to allow incoming SSH connection to the virtual server | true |  |  |
| create_public_ip | Set whether to allocate a public IP address for the virtual server instance | true |  |  |
| init_script | Script to run during the instance initialization. Defaults to an Ubuntu specific script when set to empty | true |  |  |
| tags | Tags that should be added to the instance | false |  |  |
| kms_enabled | Flag indicating that the volumes should be encrypted using a KMS. | true |  |  |
| kms_key_crn | The crn of the root key in the kms instance. Required if kms_enabled is true | true |  | kms_key.crn |
| auto_delete_volume | Flag indicating that any attached volumes should be deleted when the instance is deleted | false | true |  |
| security_group_rules | List of security group rules to set on the bastion security group in addition to the SSH rules | false | [] |  |
| allow_deprecated_image | Flag indicating that deprecated images should be allowed for use in the Virtual Server instance. If the value is `false` and the image is deprecated then the module will fail to provision | false | true |  |
| base_security_group | The id of the base security group to use for the VSI instance. If not provided the default VPC security group will be used. | false | null | vpc.base_security_group |
| acl_rules | List of rules to set on the subnet access control list | false | [] |  |
| target_network_range | The ip address range that should be used for the network acl rules generated from the security groups | false | 0.0.0.0/0 |  |

### Outputs

| Name | Description |
|------|-------------|
| ids | The instance id |
| names | The instance name |
| crns | The crn of the instance |
| public_ips | The public ips of the instances |
| private_ips | The private ips of the instances |
| location | The instance location |
| service | The name of the service for the instance |
| type | The type of the service for the instance |
| label | The label used for the instance |
| security_group_id | The id of the security group that was created |
| security_group | The security group that was created |
| output network_interface_ids { |  |
| output count { | The number of vsi instances created. Should be the same as length(names) |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.2.0)
