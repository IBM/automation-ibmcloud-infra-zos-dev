# SonarQube module

Module to populate gitops repo to deploy SonarQube


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
module "gitops-sonarqube" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-sonarqube"

  cluster_ingress_hostname = var.gitops-sonarqube_cluster_ingress_hostname
  cluster_type = var.gitops-sonarqube_cluster_type
  cluster_version = var.gitops-sonarqube_cluster_version
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  hostname = var.gitops-sonarqube_hostname
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.tools_namespace.name
  persistence = var.gitops-sonarqube_persistence
  plugins = var.gitops-sonarqube_plugins == null ? null : jsondecode(var.gitops-sonarqube_plugins)
  server_name = module.gitops_repo.server_name
  service_account_name = var.gitops-sonarqube_service_account_name
  storage_class = var.gitops-sonarqube_storage_class
  tls_secret_name = var.gitops-sonarqube_tls_secret_name
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| gitops_config | Config information regarding the gitops repo structure | true |  | gitops.gitops_config |
| git_credentials | The credentials for the gitops repo(s) | true |  | gitops.git_credentials |
| namespace | The namespace where the application should be deployed | true |  | namespace.name |
| cluster_ingress_hostname | Ingress hostname of the IKS cluster. | true |  | cluster.platform.ingress |
| cluster_type | The cluster type (openshift or ocp3 or ocp4 or kubernetes) | false | ocp4 | cluster.platform.type_code |
| tls_secret_name | The name of the secret containing the tls certificate values | true |  | cluster.platform.tls_secret |
| storage_class | The storage class to use for the persistent volume claim | true |  |  |
| service_account_name | The name of the service account that should be used for the deployment | false | sonarqube-sonarqube |  |
| plugins | The list of plugins that will be installed on SonarQube | false | https://github.com/checkstyle/sonar-checkstyle/releases/download/4.33/checkstyle-sonar-plugin-4.33.jarhttps://github.com/AmadeusITGroup/sonar-stash/releases/download/1.6.0/sonar-stash-plugin-1.6.0.jar |  |
| postgresql | Properties for an existing postgresql database | false | null |  |
| hostname | The hostname that will be used for the ingress/route | false | sonarqube |  |
| persistence | Flag indicating that persistence should be enabled for the pods | true |  |  |
| kubeseal_cert | The certificate/public key used to encrypt the sealed secrets | true |  | gitops.sealed_secrets_cert |
| server_name | The name of the server | false | default | gitops.server_name |
| cluster_version | The cluster version | true |  |  |

### Outputs

| Name | Description |
|------|-------------|
| name | The name of the module |
| branch | The branch where the module config has been placed |
| namespace | The namespace where the module will be deployed |
| server_name | The server where the module will be deployed |
| layer | The layer where the module is deployed |
| type | The type of module where the module is deployed |
| postgresql | Properties for an existing postgresql database |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.0.1)
