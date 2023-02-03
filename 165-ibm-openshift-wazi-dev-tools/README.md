# 165-ibm-openshift-wazi-dev-tools

Open-Source collection of assets for application development on OpenShift, including Wazi for Dev Spaces

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
| [argocd-bootstrap](https://github.com/cloud-native-toolkit/terraform-tools-argocd-bootstrap) | Module to provision ArgoCD and bootstrap an application using the GitOps repo | v1.13.0 |
| [gitops-cluster-config](https://github.com/cloud-native-toolkit/terraform-gitops-cluster-config) | Module to populate a gitops repository with base configuration of the Red Hat OpenShift cluster (notification banner, help menus, etc) | v1.1.1 |
| [namespace](https://github.com/cloud-native-toolkit/terraform-k8s-namespace) | Creates a namespace in the cluster | v3.2.4 |
| [namespace](https://github.com/cloud-native-toolkit/terraform-k8s-namespace) | Creates a namespace in the cluster | v3.2.4 |
| [gitea](https://github.com/cloud-native-toolkit/terraform-tools-gitea) | Module to install Gitea into a cluster via an operator | v0.5.1 |
| [gitops-namespace](https://github.com/cloud-native-toolkit/terraform-gitops-namespace) | Module to configure the provisioning of a namespace in a GitOps repo | v1.12.2 |
| [gitops-namespace](https://github.com/cloud-native-toolkit/terraform-gitops-namespace) | Module to configure the provisioning of a namespace in a GitOps repo | v1.12.2 |
| [gitops-repo](https://github.com/cloud-native-toolkit/terraform-tools-gitops) | Module to provision and set up a GitOps repository | v1.23.3 |
| [gitops-tekton-resources](https://github.com/cloud-native-toolkit/terraform-gitops-tekton-resources) | Module to populate a gitops repo with Tekton resources (tasks and pipelines). | v2.1.0 |
| [gitops-wazi-ds](https://github.com/cloud-native-toolkit/terraform-gitops-wazi-dev-spaces) | Module to populate a gitops repo with the resources to provision wazi-dev-spaces | v1.0.1 |
| [gitops-wazi-ds-op](https://github.com/cloud-native-toolkit/terraform-gitops-wazi-ds-operator) | Module to populate a gitops repo with the resources to provision wazi-dev-spaces-operator | v1.0.0 |
| [ocp-login](https://github.com/cloud-native-toolkit/terraform-ocp-login) | Module to perform a simple cluster login and provide the cluster path | v1.6.2 |
| [olm](https://github.com/cloud-native-toolkit/terraform-k8s-olm) | Installs Operator Lifecycle Manager in the cluster | v1.3.5 |
| [sealed-secret-cert](https://github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert) | Module to collect or generate the certificate and private key used for the sealed secret component | v1.0.1 |
| [util-clis](https://github.com/cloud-native-toolkit/terraform-util-clis) | Module to install clis into local bin directory | v1.18.2 |
| [gitops-buildah-unprivileged](https://github.com/cloud-native-toolkit/terraform-gitops-buildah-unprivileged) | Module to populate a gitops repo to set up a Red Hat OpenShift cluster to allow buildah to run unprivileged. | v1.1.1 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| gitops_repo_host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. |  |  |
| gitops_repo_org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. |  |  |
| gitops_repo_project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) |  |  |
| gitops_repo_username | The username of the user with access to the repository |  |  |
| gitops_repo_token | The personal access token used to access the repository | true |  |
| gitops_repo_repo | The short name of the repository (i.e. the part after the org/group name) |  |  |
| server_url | The url for the OpenShift api |  |  |
| cluster_login_token | Token used for authentication | true |  |

## Troubleshooting

