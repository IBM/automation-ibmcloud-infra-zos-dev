# Developer Dashboard module

Module to configure the provisioning of the Developer Dashboard in a GitOps repo


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- gitops (cloud-native-toolkit/gitops)

### Module dependencies


- gitops - [github.com/cloud-native-toolkit/terraform-tools-gitops.git](https://github.com/cloud-native-toolkit/terraform-tools-gitops.git) (>= 1.1.0)
- cluster - interface github.com/cloud-native-toolkit/garage-terraform-modules#cluster
- namespace - [github.com/cloud-native-toolkit/terraform-gitops-namespace.git](https://github.com/cloud-native-toolkit/terraform-gitops-namespace.git) (>= 1.0.0)

## Example usage

```hcl
module "gitops-dashboard" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-dashboard"

  cluster_ingress_hostname = var.gitops-dashboard_cluster_ingress_hostname
  cluster_type = var.gitops-dashboard_cluster_type
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  image_tag = var.gitops-dashboard_image_tag
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
  tls_secret_name = var.gitops-dashboard_tls_secret_name
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| gitops_config | Config information regarding the gitops repo structure | true |  | gitops.gitops_config |
| git_credentials | The credentials for the gitops repo(s) | true |  | gitops.git_credentials |
| cluster_type | The cluster type (openshift or ocp3 or ocp4 or kubernetes) | false | openshift | cluster.platform.type_code |
| cluster_ingress_hostname | Ingress hostname of the IKS cluster. | true |  | cluster.platform.ingress |
| tls_secret_name | The name of the secret containing the tls certificate values | true |  | cluster.platform.tls_secret |
| namespace | The namespace where the application should be deployed | true |  | namespace.name |
| server_name | The name of the server | false | default | gitops.server_name |
| image_tag | The image version tag to use | false | v1.4.4 |  |

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

> License: Apache License 2.0 | Generated by iascable (3.0.1)