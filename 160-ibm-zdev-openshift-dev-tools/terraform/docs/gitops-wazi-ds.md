# Wazi Dev Spaces module

Module to populate a gitops repo with the resources to provision wazi-dev-spaces


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- gitops (cloud-native-toolkit/gitops)

### Module dependencies


- gitops - [github.com/cloud-native-toolkit/terraform-tools-gitops.git](https://github.com/cloud-native-toolkit/terraform-tools-gitops.git) (>= 1.1.0)
- namespace - [github.com/cloud-native-toolkit/terraform-gitops-namespace.git](https://github.com/cloud-native-toolkit/terraform-gitops-namespace.git) (>= 1.0.0)
- gitops-wazi-ds-op - [github.com/cloud-native-toolkit/terraform-gitops-wazi-ds-operator.git](https://github.com/cloud-native-toolkit/terraform-gitops-wazi-ds-operator.git) (>= 1.0.0)

## Example usage

```hcl
module "gitops-wazi-ds" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-wazi-dev-spaces"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  license_accept = var.gitops-wazi-ds_license_accept
  license_type = var.gitops-wazi-ds_license_type
  namespace = module.wazi_namespace.name
  server_name = module.gitops_repo.server_name
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| gitops_config | Config information regarding the gitops repo structure | true |  | gitops.gitops_config |
| git_credentials | The credentials for the gitops repo(s) | true |  | gitops.git_credentials |
| namespace | The namespace where the application should be deployed | false | wazi-devspaces | namespace.name |
| kubeseal_cert | The certificate/public key used to encrypt the sealed secrets | true |  | gitops.sealed_secrets_cert |
| server_name | The name of the server | false | default | gitops.server_name |
| license_accept | License acceptance | false | true |  |
| license_type | <idzee/wazi> Choose between idzee/wazi installations of devspaces on your project | false | wazi |  |

### Outputs

| Name | Description |
|------|-------------|
| name | The name of the module |
| branch | The branch where the module config has been placed |
| namespace | The namespace where the module will be deployed |
| server_name | The server where the module will be deployed |
| layer | The layer where the module is deployed |
| type | The type of module where the module is deployed |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.2.0)
