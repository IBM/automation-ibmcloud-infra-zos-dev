#! /bin/bash

if [[ -f "${PWD}/terragrunt.hcl" ]]; then
  terragrunt destroy -auto-approve
else
  if [[ -f "${PWD}/terraform/terraform.tfstate" ]]; then
    cd terraform; terraform destroy -auto-approve
  else
    terraform destroy -auto-approve
  fi
fi
