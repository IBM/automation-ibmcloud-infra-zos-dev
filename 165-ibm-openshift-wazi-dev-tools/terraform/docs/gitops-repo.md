# GitOps repo module

Module to provision and set up a GitOps repository


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- gitops (cloud-native-toolkit/gitops)
- clis (cloud-native-toolkit/clis)

### Module dependencies


- cert - [github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert](https://github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert) (>= 1.0.0)
- gitea - [github.com/cloud-native-toolkit/terraform-tools-gitea](https://github.com/cloud-native-toolkit/terraform-tools-gitea) (>= 0.3.0)

## Example usage

```hcl
module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops"

  branch = var.gitops_repo_branch
  debug = var.debug
  gitea_host = module.gitea.host
  gitea_org = module.gitea.org
  gitea_token = module.gitea.token
  gitea_username = module.gitea.username
  gitops_namespace = var.gitops_repo_gitops_namespace
  host = var.gitops_repo_host
  org = var.gitops_repo_org
  project = var.gitops_repo_project
  public = var.gitops_repo_public
  repo = var.gitops_repo_repo
  sealed_secrets_cert = module.sealed-secret-cert.cert
  server_name = var.gitops_repo_server_name
  strict = var.gitops_repo_strict
  token = var.gitops_repo_token
  type = var.gitops_repo_type
  username = var.gitops_repo_username
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. | true |  |  |
| type | [Deprecated] The type of the hosted git repository. | true |  |  |
| org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. | true |  |  |
| project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) | true |  |  |
| username | The username of the user with access to the repository | true |  |  |
| token | The personal access token used to access the repository | true |  |  |
| gitea_host | The host for the default gitea repository. | true |  | gitea.host |
| gitea_org | The org/group for the default gitea repository. If not provided, the value will default to the username org | true |  | gitea.org |
| gitea_username | The username of the default gitea repository | true |  | gitea.username |
| gitea_token | The personal access token used to access the repository | true |  | gitea.token |
| repo | The short name of the repository (i.e. the part after the org/group name) | true |  |  |
| branch | The name of the branch that will be used. If the repo already exists (provision=false) then it is assumed this branch already exists as well | false | main |  |
| public | Flag indicating that the repo should be public or private | true |  |  |
| gitops_namespace | The namespace where ArgoCD is running in the cluster | false | openshift-gitops |  |
| server_name | The name of the cluster that will be configured via gitops. This is used to separate the config by cluster | false | default |  |
| sealed_secrets_cert | The certificate/public key used to encrypt the sealed secrets | true |  | cert.cert |
| strict | Flag indicating that an error should be thrown if the repo already exists | true |  |  |
| debug | Flag indicating that debug loggging should be enabled | true |  |  |

### Outputs

| Name | Description |
|------|-------------|
| config_host | The host name of the bootstrap git repo |
| config_org | The org name of the bootstrap git repo |
| config_name | The repo name of the bootstrap git repo |
| config_project | The project name of the bootstrap git repo (for Azure DevOps) |
| config_repo | The repo that contains the argocd configuration |
| config_repo_url | The repo that contains the argocd configuration |
| config_ca_cert | The ca cert for the self-signed certificate used by the gitops repo |
| config_username | The username for the config repo |
| config_token | The token for the config repo |
| config_paths | The paths in the config repo |
| config_projects | The ArgoCD projects for the different layers of the repo |
| bootstrap_path | The path to the bootstrap configuration |
| bootstrap_branch | The branch in the gitrepo containing the bootstrap configuration |
| application_repo | The repo that contains the application configuration |
| application_repo_url | The repo that contains the application configuration |
| application_username | The username for the application repo |
| application_token | The token for the application repo |
| application_paths | The paths in the application repo |
| gitops_config | Config information regarding the gitops repo structure |
| git_credentials | The credentials for the gitops repo(s) |
| server_name | The name of the cluster that will be configured for gitops |
| sealed_secrets_cert | The certificate used to encrypt sealed secrets |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.2.0)
