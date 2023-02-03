# 120-ibm-zdev-network-vpc-openshift

Network VPC with VPN and Bastion servers

## Running the automation

There are three different options for how to configure and run the automation:

- Interactive prompts
- Yaml configuration
- Terraform configuration

### Interactive prompts

In this mode, you will be prompted interactively for the variables required to run the automation.

1. Run the `apply.sh` script
2. At each prompt, provide a value for the variable.
3. Once all the variables are collected, you will be asked to apply the automation. Enter `y` to continue or `n` to stop. Either way, the values provided have been collected and written to two sets of files so that next time you can skip the prompts.

The `apply.sh` script will generate credentials.yaml and variables.yaml input files that can be used
for future deployments as well as generating the credentials.auto.tfvars and terraform.tfvars files
used by the terraform. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Yaml configuration

In this mode, you provide the configuration for your instance in yaml configuration files and avoid
the prompts.

1. Copy the variables.template.yaml file to variables.yaml and credentials.template.yaml to credentials.yaml.
2. Provide values for each of the variables in variables.yaml and credentials.yaml.
3. Run `apply.sh --ci` to kick off the automation. You will not be prompted for input variables and the automation will start immediately

The `apply.sh` script will generate the credentials.auto.tfvars and terraform.tfvars files from the
values provided in the yaml files. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Terraform configuration

In situations where you are comfortable working with the terraform directly, you can skip the yaml
configuration files and directly configure the automation with the terraform configuration files.

1. Copy the variables.template.tfvars file and credentials.auto.template.tfvars to variables.tfvars and credentials.auto.tfvars, respectively.
2. Provide values for the different variables in variables.tfvars and credentials.auto.tfvars.
3. Kick off the automation with `apply.sh --ci` or skip the script and run `terragrunt run-all apply --terragrunt-parallelism 1 --terragrunt-non-interactive`

The terraform.tfvars file can be checked in with the terraform templates. However, credentials.auto.tfvars
should be excluded since it contains sensitive information. The credentials.auto.tfvars file should
already be in .gitignore.

## Contents

### Modules

| Name | Description | Version |
|------|-------------|---------|
| [ibm-access-group](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-access-group) | Module to create ADMIN and USER access groups for a set of resource groups | v3.1.8 |
| [ibm-activity-tracker](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-activity-tracker) | Provisions the IBM Cloud hosted Activity Tracker service | v2.4.18 |
| [ibm-cloud-monitoring](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-cloud-monitoring) | Module provision an instance of IBM Cloud Monitoring in an IBM Cloud account | v4.1.3 |
| [ibm-flow-logs](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-flow-log) | Module to create Flow Logs for a provided resource | v1.0.3 |
| [ibm-iam-service-authorization](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-iam-service-authorization) | Module to create an authorization policy that will allow one service to access another. | v1.2.14 |
| [ibm-kms](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-kms) | Module to provision Key Protect | v0.3.6 |
| [ibm-kms-key](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-kms-key) | Module to lookup or create a KMS key | v1.5.4 |
| [ibm-object-storage-bucket](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-object-storage-bucket) | Module to provision a Cloud Object Storage bucket | v0.8.4 |
| [ibm-resource-group](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group) | Creates a resource groups in the account | v3.3.5 |
| [ibm-resource-group](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group) | Creates a resource groups in the account | v3.3.5 |
| [ibm-resource-group](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group) | Creates a resource groups in the account | v3.3.5 |
| [ibm-resource-group](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group) | Creates a resource groups in the account | v3.3.5 |
| [ibm-object-storage](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-object-storage) | Module to work with an IBM Cloud Object Storage instance. | v4.1.0 |
| [ibm-secrets-manager](https://github.com/cloud-native-toolkit/terraform-ibm-secrets-manager) | Module to provision an IBM Cloud Secrets Manager instance | v1.1.0 |
| [ibm-vpc](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc) | Provisions the IBM Cloud VPC instance with network acls | v1.17.0 |
| [ibm-vpc-gateways](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-gateways) | Terraform module to provision public gateways for an existing VPC instance | v1.10.0 |
| [ibm-vpc-ssh](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-ssh) | Module to register an ssh key into the IBM Cloud infrastructure for use in securely accessing VPC resources | v1.7.3 |
| [ibm-vpc-subnets](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-subnets) | Module to provision a collection of subnets for an existing VPC | v1.14.0 |
| [ibm-vpc-subnets](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-subnets) | Module to provision a collection of subnets for an existing VPC | v1.14.0 |
| [ibm-vpc-subnets](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-subnets) | Module to provision a collection of subnets for an existing VPC | v1.14.0 |
| [ibm-vpc-subnets](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-subnets) | Module to provision a collection of subnets for an existing VPC | v1.14.0 |
| [ibm-vpc-subnets](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-subnets) | Module to provision a collection of subnets for an existing VPC | v1.14.0 |
| [ibm-ocp-vpc](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-ocp-vpc) | Provisions an IBM Cloud OCP cluster | v1.16.3 |
| [ibm-vpc-vpn-gateway](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpn-gateway) | Module to provision a VPN Gateway within a Virtual Private Cloud instance | v1.1.6 |
| [ibm-vpc-vsi](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpc-vsi) | Module to provision virtual server instance | v1.12.3 |
| [ibm-vpe-gateway](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpe-gateway) | Provisions a Virtual Private Gateway for a provided resource, connecting that resource to the provided subnet | v1.6.2 |
| [ibm-vpn-server](https://github.com/terraform-ibm-modules/terraform-ibm-toolkit-vpn-server) | Module to provision a client to site VPN server instance in an IBM Cloud account | v0.2.3 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| ibmcloud_api_key | The api key used to access IBM Cloud | true |  |
| region |  |  |  |
| zos_name_prefix | The prefix name for the service. If not provided it will default to the resource group name |  |  |
| kms_region | Geographic location of the resource (e.g. us-south, us-east) |  |  |
| kms_service | The name of the KMS provider that should be used (keyprotect or hpcs) |  | keyprotect |
| kms_resource_group_name | The name of the resource group |  |  |
| at_resource_group_name | The name of the resource group |  |  |
| zos_resource_group_name | The name of the resource group |  |  |
| common_tags | Common tags that should be added to the instance |  |  |
| vpe-subnets__count | The number of subnets that should be provisioned |  | 1 |
| ingress-subnets__count | The number of subnets that should be provisioned |  | 1 |
| worker-subnets__count | The number of subnets that should be provisioned |  | 1 |
| egress-subnets__count | The number of subnets that should be provisioned |  | 1 |
| vsi-subnets__count | The number of subnets that should be provisioned |  | 1 |
| worker_count | The number of worker nodes that should be provisioned for classic infrastructure |  | 3 |
| cluster_flavor | The machine type that will be provisioned for classic infrastructure |  | bx2.4x16 |

## Troubleshooting

