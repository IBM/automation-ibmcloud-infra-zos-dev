module "argocd-bootstrap" {
  source = "github.com/cloud-native-toolkit/terraform-tools-argocd-bootstrap?ref=v1.12.0"

  bootstrap_path = module.gitops_repo.bootstrap_path
  bootstrap_prefix = var.argocd-bootstrap_bootstrap_prefix
  cluster_config_file = module.cluster.config_file_path
  cluster_type = module.cluster.platform.type_code
  create_webhook = var.argocd-bootstrap_create_webhook
  git_token = module.gitops_repo.config_token
  git_username = module.gitops_repo.config_username
  gitops_repo_url = module.gitops_repo.config_repo_url
  ingress_subdomain = module.cluster.platform.ingress
  olm_namespace = module.olm.olm_namespace
  operator_namespace = module.olm.target_namespace
  sealed_secret_cert = module.sealed-secret-cert.cert
  sealed_secret_private_key = module.sealed-secret-cert.private_key
}
module "cluster" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-ocp-vpc?ref=v1.16.3"

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
  name_prefix = var.zos_name_prefix
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
module "gitea" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitea?ref=v0.5.1"

  ca_cert = var.gitea_ca_cert
  ca_cert_file = var.gitea_ca_cert_file
  cluster_config_file = module.cluster.config_file_path
  cluster_type = module.cluster.platform.type_code
  instance_name = var.gitea_instance_name
  instance_namespace = module.gitea_namespace.name
  olm_namespace = module.olm.olm_namespace
  operator_namespace = module.olm.target_namespace
  password = var.gitea_password
  username = var.gitea_username
}
module "gitea_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-namespace?ref=v3.2.4"

  cluster_config_file_path = module.cluster.config_file_path
  create_operator_group = var.gitea_namespace_create_operator_group
  name = var.gitea_namespace_name
}
module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.23.3"

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
module "gitops-artifactory" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-artifactory?ref=v1.3.0"

  cluster_ingress_hostname = var.gitops-artifactory_cluster_ingress_hostname
  cluster_type = var.gitops-artifactory_cluster_type
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  namespace = module.tools_namespace.name
  persistence = var.gitops-artifactory_persistence
  server_name = module.gitops_repo.server_name
  storage_class = var.gitops-artifactory_storage_class
  tls_secret_name = var.gitops-artifactory_tls_secret_name
}
module "gitops-buildah-unprivileged" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-buildah-unprivileged?ref=v1.1.1"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
}
module "gitops-cluster-config" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cluster-config?ref=v1.1.1"

  banner_background_color = var.gitops-cluster-config_banner_background_color
  banner_text = var.gitops-cluster-config_banner_text
  banner_text_color = var.gitops-cluster-config_banner_text_color
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
}
module "gitops-dashboard" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-dashboard?ref=v1.7.0"

  cluster_ingress_hostname = var.gitops-dashboard_cluster_ingress_hostname
  cluster_type = var.gitops-dashboard_cluster_type
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  image_tag = var.gitops-dashboard_image_tag
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
  tls_secret_name = var.gitops-dashboard_tls_secret_name
}
module "gitops-pact-broker" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-pact-broker?ref=v1.2.0"

  cluster_ingress_hostname = var.gitops-pact-broker_cluster_ingress_hostname
  cluster_type = var.gitops-pact-broker_cluster_type
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
  tls_secret_name = var.gitops-pact-broker_tls_secret_name
}
module "gitops-sonarqube" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-sonarqube?ref=v1.3.0"

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
module "gitops-tekton-resources" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-tekton-resources?ref=v2.1.0"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
  task_release = var.gitops-tekton-resources_task_release
}
module "gitops-wazi-ds" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-wazi-dev-spaces?ref=v1.0.0"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
}
module "gitops-wazi-ds-op" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-wazi-ds-operator?ref=v1.0.0"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
}
module "olm" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-olm?ref=v1.3.5"

  cluster_config_file = module.cluster.config_file_path
  cluster_type = module.cluster.platform.type_code
  cluster_version = module.cluster.platform.version
}
module "openshift-cicd" {
  source = "github.com/cloud-native-toolkit/terraform-tools-openshift-cicd?ref=v1.11.1"

  cluster_config_file = module.cluster.config_file_path
  cluster_type = module.cluster.platform.type_code
  gitops_namespace = module.openshift-gitops.name
  ingress_subdomain = module.cluster.platform.ingress
  olm_namespace = module.olm.olm_namespace
  operator_namespace = module.olm.target_namespace
  sealed_secret_cert = module.sealed-secret-cert.cert
  sealed_secret_namespace = module.sealed-secret.name
  sealed_secret_private_key = module.sealed-secret-cert.private_key
}
module "openshift-gitops" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-namespace?ref=v3.2.4"

  cluster_config_file_path = module.cluster.config_file_path
  create_operator_group = var.openshift-gitops_create_operator_group
  name = var.openshift-gitops_name
}
module "registry" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-image-registry?ref=v2.1.4"

  cluster_namespace = module.openshift-gitops.name
  cluster_type_code = module.cluster.platform.type_code
  config_file_path = module.cluster.config_file_path
  gitops_dir = var.gitops_dir
  ibmcloud_api_key = var.ibmcloud_api_key
  private_endpoint = var.private_endpoint
  region = var.region
  registry_namespace = var.registry_namespace
  resource_group_name = module.resource_group.name
}
module "resource_group" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group?ref=v3.3.5"

  ibmcloud_api_key = var.ibmcloud_api_key
  purge_volumes = var.purge_volumes
  resource_group_name = var.zos_resource_group_name
  sync = var.resource_group_sync
}
module "sealed-secret" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-namespace?ref=v3.2.4"

  cluster_config_file_path = module.cluster.config_file_path
  create_operator_group = var.sealed-secret_create_operator_group
  name = var.sealed-secret_name
}
module "sealed-secret-cert" {
  source = "github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert?ref=v1.0.1"

  cert = var.sealed-secret-cert_cert
  cert_file = var.sealed-secret-cert_cert_file
  private_key = var.sealed-secret-cert_private_key
  private_key_file = var.sealed-secret-cert_private_key_file
}
module "tools_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.12.2"

  argocd_namespace = var.tools_namespace_argocd_namespace
  ci = var.tools_namespace_ci
  create_operator_group = var.tools_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.tools_namespace_name
  server_name = module.gitops_repo.server_name
}
module "util-clis" {
  source = "cloud-native-toolkit/clis/util"
  version = "1.18.2"

  bin_dir = var.util-clis_bin_dir
  clis = var.util-clis_clis == null ? null : jsondecode(var.util-clis_clis)
}
