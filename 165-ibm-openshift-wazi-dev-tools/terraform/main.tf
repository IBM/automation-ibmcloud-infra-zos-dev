module "argocd-bootstrap" {
  source = "github.com/cloud-native-toolkit/terraform-tools-argocd-bootstrap?ref=v1.13.0"

  bootstrap_path = module.gitops_repo.bootstrap_path
  bootstrap_prefix = var.argocd-bootstrap_bootstrap_prefix
  cluster_config_file = module.cluster.config_file_path
  cluster_type = module.cluster.platform.type_code
  create_webhook = var.argocd-bootstrap_create_webhook
  git_ca_cert = module.gitops_repo.config_ca_cert
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
  source = "github.com/cloud-native-toolkit/terraform-ocp-login?ref=v1.6.2"

  ca_cert = var.cluster_ca_cert
  ca_cert_file = var.cluster_ca_cert_file
  cluster_version = var.cluster_cluster_version
  ingress_subdomain = var.cluster_ingress_subdomain
  login_password = var.cluster_login_password
  login_token = var.cluster_login_token
  login_user = var.cluster_login_user
  server_url = var.server_url
  skip = var.cluster_skip
  tls_secret_name = var.cluster_tls_secret_name
}
module "gitea" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitea?ref=v0.5.1"

  ca_cert = module.cluster.ca_cert
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
module "gitops-tekton-resources" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-tekton-resources?ref=v2.1.0"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  namespace = module.tools_namespace.name
  server_name = module.gitops_repo.server_name
  task_release = var.gitops-tekton-resources_task_release
}
module "gitops-wazi-ds" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-wazi-dev-spaces?ref=v1.0.1"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  license_accept = var.gitops-wazi-ds_license_accept
  license_type = var.gitops-wazi-ds_license_type
  namespace = module.wazi_namespace.name
  server_name = module.gitops_repo.server_name
}
module "gitops-wazi-ds-op" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-wazi-ds-operator?ref=v1.0.0"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.wazi_namespace.name
  server_name = module.gitops_repo.server_name
}
module "olm" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-olm?ref=v1.3.5"

  cluster_config_file = module.cluster.config_file_path
  cluster_type = module.cluster.platform.type_code
  cluster_version = module.cluster.platform.version
}
module "openshift-gitops" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-namespace?ref=v3.2.4"

  cluster_config_file_path = module.cluster.config_file_path
  create_operator_group = var.openshift-gitops_create_operator_group
  name = var.openshift-gitops_name
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
module "wazi_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.12.2"

  argocd_namespace = var.wazi_namespace_argocd_namespace
  ci = var.wazi_namespace_ci
  create_operator_group = var.wazi_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.wazi_namespace_name
  server_name = module.gitops_repo.server_name
}
