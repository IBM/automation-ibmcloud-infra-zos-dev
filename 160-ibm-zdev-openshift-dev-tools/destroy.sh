#! /bin/bash

if [[ -f "${PWD}/terragrunt.hcl" ]]; then
  terragrunt destroy -auto-approve
else
  terraform destroy -auto-approve
fi
