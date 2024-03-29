# IBM VPC SSH module

Module to register an ssh key into the IBM Cloud infrastructure for use in securely accessing VPC resources


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- ibm (ibm-cloud/ibm)

### Module dependencies


- resource_group - [github.com/cloud-native-toolkit/terraform-ibm-resource-group](https://github.com/cloud-native-toolkit/terraform-ibm-resource-group) (>= 2.1.0)

## Example usage

```hcl
module "dev_ssh_vsi" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-ssh"

  label = var.dev_ssh_vsi_label
  name = var.dev_ssh_vsi_name
  name_prefix = var.name_prefix
  private_key = var.dev_ssh_vsi_private_key
  private_key_file = var.dev_ssh_vsi_private_key_file
  public_key = var.dev_ssh_vsi_public_key
  public_key_file = var.dev_ssh_vsi_public_key_file
  resource_group_name = module.resource_group.name
  rsa_bits = var.dev_ssh_vsi_rsa_bits
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| resource_group_name | Name of resource group in which to create the ssh key instance.  | true |  | resource_group.name |
| name_prefix | (Optional) Prefix used to name all resources. If not provided then resource_group_name is used. | true |  |  |
| name | (Optional) Name given to the ssh key instance. If not provided it will be generated using prefix_name | true |  |  |
| label | (Optional) Label used for the instance. It will be added to the name_prefix to create the name if the name is not provided. | false | sshkey |  |
| public_key | The public key provided for the ssh key. If empty string is provided then a new key will be generated. | true |  |  |
| private_key | The private key provided for the ssh key. If empty string is provided then a new key will be generated. | true |  |  |
| public_key_file | The name of the file containing the public key provided for the ssh key. If empty string is provided then a new key will be generated. | true |  |  |
| private_key_file | The name of the file containing the private key provided for the ssh key. If empty string is provided then a new key will be generated. | true |  |  |
| rsa_bits | The number of bits for the rsa key, if it will be generated | false | 3072 |  |

### Outputs

| Name | Description |
|------|-------------|
| id | The id of the ssh key |
| public_key | The public key value in openssh format |
| private_key | The private key value |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.2.0)
