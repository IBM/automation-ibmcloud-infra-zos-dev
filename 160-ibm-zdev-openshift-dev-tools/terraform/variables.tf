variable "gitops-artifactory_cluster_ingress_hostname" {
  type = string
  description = "Ingress hostname of the IKS cluster."
  default = ""
}
variable "gitops-artifactory_cluster_type" {
  type = string
  description = "The cluster type (openshift or ocp3 or ocp4 or kubernetes)"
  default = "ocp4"
}
variable "gitops-artifactory_tls_secret_name" {
  type = string
  description = "The name of the secret containing the tls certificate values"
  default = ""
}
variable "gitops-artifactory_storage_class" {
  type = string
  description = "The storage class to use for the persistent volume claim"
  default = ""
}
variable "gitops-artifactory_persistence" {
  type = bool
  description = "Flag to indicate if persistence should be enabled"
  default = true
}
variable "gitops_default_host" {
  type = string
  description = "the value of gitops_default_host"
  default = ""
}
variable "gitops_default_org" {
  type = string
  description = "the value of gitops_default_org"
  default = ""
}
variable "gitops_default_username" {
  type = string
  description = "the value of gitops_default_username"
  default = ""
}
variable "gitops_default_token" {
  type = string
  description = "the value of gitops_default_token"
  default = ""
}
variable "gitops_default_ca_cert" {
  type = string
  description = "the value of gitops_default_ca_cert"
  default = ""
}
variable "gitops_host" {
  type = string
  description = "The host name of the gitops repository (GitHub, Github Enterprise, Gitlab, Bitbucket, Azure DevOps, and Gitea servers are supported)."
  default = ""
}
variable "gitops_org" {
  type = string
  description = "The organization on the git server where the repsitory will be located. If not provided the org will default to the username."
  default = ""
}
variable "gitops_project" {
  type = string
  description = "The Azure DevOps project in the git server. This value is only applied for Azure DevOps servers."
  default = ""
}
variable "gitops_repo" {
  type = string
  description = "The name of the repository in the org on the git server."
  default = ""
}
variable "gitops_username" {
  type = string
  description = "The username used to access the git server."
  default = ""
}
variable "gitops_token" {
  type = string
  description = "The token used to access the git server."
  default = ""
}
variable "gitops_branch" {
  type = string
  description = "The name of the branch in the gitops repository where the config will be stored."
  default = "main"
}
variable "gitops_server_name" {
  type = string
  description = "The name of the server the configuration with which the configuration will be associated."
  default = "default"
}
variable "gitops_ca_cert" {
  type = string
  description = "The ca certificate used to sign the self-signed certificate used by the git server, if applicable."
  default = ""
}
variable "gitops_ca_cert_file" {
  type = string
  description = "The file containing the ca certificate used to sign the self-signed certificate used by the git server, if applicable."
  default = ""
}
variable "gitops-cluster-config_banner_background_color" {
  type = string
  description = "The background color of the top banner. This value can be a named color (e.g. purple, red) or an RGB value (#FF0000)."
  default = "purple"
}
variable "gitops-cluster-config_banner_text_color" {
  type = string
  description = "The text color for the top banner. This value can be a named color (e.g. purple, red) or an RGB value (#FF0000)."
  default = "white"
}
variable "gitops-cluster-config_banner_text" {
  type = string
  description = "The text that will appear in the top banner in the cluster"
  default = "Z/OS Development"
}
variable "gitops-dashboard_cluster_type" {
  type = string
  description = "The cluster type (openshift or ocp3 or ocp4 or kubernetes)"
  default = "openshift"
}
variable "gitops-dashboard_cluster_ingress_hostname" {
  type = string
  description = "Ingress hostname of the IKS cluster."
  default = ""
}
variable "gitops-dashboard_tls_secret_name" {
  type = string
  description = "The name of the secret containing the tls certificate values"
  default = ""
}
variable "gitops-dashboard_image_tag" {
  type = string
  description = "The image version tag to use"
  default = "v1.4.4"
}
variable "tools_namespace_name" {
  type = string
  description = "The value that should be used for the namespace"
  default = "tools"
}
variable "tools_namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "tools_namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "tools_namespace_argocd_namespace" {
  type = string
  description = "The namespace where argocd has been deployed"
  default = "openshift-gitops"
}
variable "gitops-pact-broker_cluster_type" {
  type = string
  description = "The cluster type (openshift or ocp3 or ocp4 or kubernetes)"
  default = "ocp4"
}
variable "gitops-pact-broker_cluster_ingress_hostname" {
  type = string
  description = "Ingress hostname of the IKS cluster."
  default = ""
}
variable "gitops-pact-broker_tls_secret_name" {
  type = string
  description = "The name of the secret containing the tls certificate values"
  default = ""
}
variable "gitops_repo_host" {
  type = string
  description = "The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used."
  default = ""
}
variable "gitops_repo_type" {
  type = string
  description = "[Deprecated] The type of the hosted git repository."
  default = ""
}
variable "gitops_repo_org" {
  type = string
  description = "The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used."
  default = ""
}
variable "gitops_repo_project" {
  type = string
  description = "The project that will be used for the git repo. (Primarily used for Azure DevOps repos)"
  default = ""
}
variable "gitops_repo_username" {
  type = string
  description = "The username of the user with access to the repository"
  default = ""
}
variable "gitops_repo_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops_repo_gitea_host" {
  type = string
  description = "The host for the default gitea repository."
  default = ""
}
variable "gitops_repo_gitea_org" {
  type = string
  description = "The org/group for the default gitea repository. If not provided, the value will default to the username org"
  default = ""
}
variable "gitops_repo_gitea_username" {
  type = string
  description = "The username of the default gitea repository"
  default = ""
}
variable "gitops_repo_gitea_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops_repo_repo" {
  type = string
  description = "The short name of the repository (i.e. the part after the org/group name)"
}
variable "gitops_repo_branch" {
  type = string
  description = "The name of the branch that will be used. If the repo already exists (provision=false) then it is assumed this branch already exists as well"
  default = "main"
}
variable "gitops_repo_public" {
  type = bool
  description = "Flag indicating that the repo should be public or private"
  default = false
}
variable "gitops_repo_gitops_namespace" {
  type = string
  description = "The namespace where ArgoCD is running in the cluster"
  default = "openshift-gitops"
}
variable "gitops_repo_server_name" {
  type = string
  description = "The name of the cluster that will be configured via gitops. This is used to separate the config by cluster"
  default = "default"
}
variable "gitops_repo_strict" {
  type = bool
  description = "Flag indicating that an error should be thrown if the repo already exists"
  default = false
}
variable "debug" {
  type = bool
  description = "Flag indicating that debug loggging should be enabled"
  default = false
}
variable "gitops-sonarqube_cluster_ingress_hostname" {
  type = string
  description = "Ingress hostname of the IKS cluster."
  default = ""
}
variable "gitops-sonarqube_cluster_type" {
  type = string
  description = "The cluster type (openshift or ocp3 or ocp4 or kubernetes)"
  default = "ocp4"
}
variable "gitops-sonarqube_tls_secret_name" {
  type = string
  description = "The name of the secret containing the tls certificate values"
  default = ""
}
variable "gitops-sonarqube_storage_class" {
  type = string
  description = "The storage class to use for the persistent volume claim"
  default = ""
}
variable "gitops-sonarqube_service_account_name" {
  type = string
  description = "The name of the service account that should be used for the deployment"
  default = "sonarqube-sonarqube"
}
variable "gitops-sonarqube_plugins" {
  type = string
  description = "The list of plugins that will be installed on SonarQube"
  default = "[\"https://github.com/checkstyle/sonar-checkstyle/releases/download/4.33/checkstyle-sonar-plugin-4.33.jar\",\"https://github.com/AmadeusITGroup/sonar-stash/releases/download/1.6.0/sonar-stash-plugin-1.6.0.jar\"]"
}
variable "gitops-sonarqube_hostname" {
  type = string
  description = "The hostname that will be used for the ingress/route"
  default = "sonarqube"
}
variable "gitops-sonarqube_persistence" {
  type = bool
  description = "Flag indicating that persistence should be enabled for the pods"
  default = false
}
variable "gitops-sonarqube_cluster_version" {
  type = string
  description = "The cluster version"
  default = ""
}
variable "gitops-tekton-resources_task_release" {
  type = string
  description = "The release version of the tekton tasks"
  default = "v3.0.3"
}
variable "ibmcloud_api_key" {
  type = string
  description = "The IBM Cloud api key"
}
variable "zos_resource_group_name" {
  type = string
  description = "The name of the resource group"
}
variable "resource_group_sync" {
  type = string
  description = "Value used to order the provisioning of the resource group"
  default = ""
}
variable "purge_volumes" {
  type = bool
  description = "Flag indicating that any volumes in the resource group should be automatically destroyed before destroying the resource group. If volumes exist and the flag is false then the destroy will fail."
  default = false
}
variable "region" {
  type = string
  description = "the value of region"
}
variable "cluster_name" {
  type = string
  description = "The name of the cluster that will be created within the resource group"
  default = ""
}
variable "worker_count" {
  type = number
  description = "The number of worker nodes that should be provisioned for classic infrastructure"
  default = 3
}
variable "cluster_flavor" {
  type = string
  description = "The machine type that will be provisioned for classic infrastructure"
  default = "bx2.4x16"
}
variable "ocp_version" {
  type = string
  description = "The version of the OpenShift cluster that should be provisioned (format 4.x)"
  default = "4.10"
}
variable "cluster_exists" {
  type = bool
  description = "Flag indicating if the cluster already exists (true or false)"
  default = true
}
variable "cluster_disable_public_endpoint" {
  type = bool
  description = "Flag indicating that the public endpoint should be disabled"
  default = false
}
variable "zos_name_prefix" {
  type = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
}
variable "cluster_ocp_entitlement" {
  type = string
  description = "Value that is applied to the entitlements for OCP cluster provisioning"
  default = "cloud_pak"
}
variable "cluster_force_delete_storage" {
  type = bool
  description = "Attribute to force the removal of persistent storage associtated with the cluster"
  default = false
}
variable "cluster_tags" {
  type = string
  description = "Tags that should be added to the instance"
  default = "[]"
}
variable "cluster_vpc_name" {
  type = string
  description = "Name of the VPC instance that will be used"
  default = ""
}
variable "cluster_vpc_subnet_count" {
  type = number
  description = "Number of vpc subnets"
  default = 0
}
variable "cluster_vpc_subnets" {
  type = string
  description = "List of subnets with labels"
  default = "[]"
}
variable "cluster_cos_id" {
  type = string
  description = "The crn of the COS instance that will be used with the OCP instance"
  default = ""
}
variable "cluster_kms_enabled" {
  type = bool
  description = "Flag indicating that kms encryption should be enabled for this cluster"
  default = false
}
variable "cluster_kms_id" {
  type = string
  description = "The crn of the KMS instance that will be used to encrypt the cluster."
  default = null
}
variable "cluster_kms_key_id" {
  type = string
  description = "The id of the root key in the KMS instance that will be used to encrypt the cluster."
  default = null
}
variable "cluster_kms_private_endpoint" {
  type = bool
  description = "Flag indicating that the private endpoint should be used to connect the KMS system to the cluster."
  default = true
}
variable "cluster_login" {
  type = bool
  description = "Flag indicating that after the cluster is provisioned, the module should log into the cluster"
  default = true
}
variable "common_tags" {
  type = string
  description = "Common tags that should be added to the instance"
  default = "[]"
}
variable "openshift-gitops_name" {
  type = string
  description = "The namespace that should be created"
  default = "openshift-gitops"
}
variable "openshift-gitops_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "registry_namespace" {
  type = string
  description = "The namespace that will be created in the IBM Cloud image registry. If not provided the value will default to the resource group"
}
variable "gitops_dir" {
  type = string
  description = "The directory where the gitops configuration should be stored"
  default = ""
}
variable "private_endpoint" {
  type = string
  description = "Flag indicating that the registry url should be created with private endpoints"
  default = "true"
}
variable "util-clis_bin_dir" {
  type = string
  description = "The directory where the clis should be downloaded. If not provided will default to ./bin"
  default = ""
}
variable "util-clis_clis" {
  type = string
  description = "The list of clis that should be made available in the bin directory. Supported values are yq, jq, igc, helm, argocd, rosa, gh, glab, and kubeseal. (If not provided the list will default to yq, jq, and igc)"
  default = "[\"yq\",\"jq\",\"igc\"]"
}
variable "sealed-secret_name" {
  type = string
  description = "The namespace that should be created"
  default = "sealed-secrets"
}
variable "sealed-secret_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "sealed-secret-cert_cert" {
  type = string
  description = "The public key that will be used to encrypt sealed secrets. If not provided, a new one will be generated"
  default = ""
}
variable "sealed-secret-cert_private_key" {
  type = string
  description = "The private key that will be used to decrypt sealed secrets. If not provided, a new one will be generated"
  default = ""
}
variable "sealed-secret-cert_cert_file" {
  type = string
  description = "The file containing the public key that will be used to encrypt the sealed secrets. If not provided a new public key will be generated"
  default = ""
}
variable "sealed-secret-cert_private_key_file" {
  type = string
  description = "The file containin the private key that will be used to encrypt the sealed secrets. If not provided a new private key will be generated"
  default = ""
}
