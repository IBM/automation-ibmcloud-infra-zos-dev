
provider "gitops" {




  bin_dir = module.util-clis.bin_dir
  default_host = var.gitops_default_host
  default_org = var.gitops_default_org
  default_username = var.gitops_default_username
  default_token = var.gitops_default_token
  default_ca_cert = var.gitops_default_ca_cert
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
provider "ibm" {




  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}