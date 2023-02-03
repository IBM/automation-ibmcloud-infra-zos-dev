
provider "gitops" {




  bin_dir = module.util-clis.bin_dir
  default_host = module.gitea.host
  default_org = module.gitea.org
  default_username = module.gitea.username
  default_token = module.gitea.token
  default_ca_cert = module.gitea.ca_cert
  host = var.gitops_host
  org = var.gitops_org
  project = var.gitops_project
  repo = var.gitops_repo
  username = var.gitops_username
  token = var.gitops_token
  branch = var.gitops_branch
  server_name = var.gitops_server_name
  ca_cert = var.gitops_ca_cert
  ca_cert_file = var.gitops_ca_cert_file
}
provider "clis" {




}