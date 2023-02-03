#!/usr/bin/env bash

TERRAFORM_DIR=$(find . -name "main.tf" | grep -v ".terraform/modules" | sed -E 's~^./~~g' | sed -E 's~/main.tf$~~g')

if [[ -f "${TERRAFORM_DIR}/terragrunt.hcl" ]]; then
  cd "${TERRAFORM_DIR}" || exit 1

  terragrunt apply -auto-approve
else
  VARIABLES_FILE="${1}"

  if [[ -z "${VARIABLES_FILE}" ]]; then
    VARIABLES_FILE="variables.yaml"
  fi

  if [[ -z "${CREDENTIALS_FILE}" ]]; then
    CREDENTIALS_FILE="credentials.yaml"
  fi

  YQ=$(command -v yq4 || command -v yq)
  if [[ -z "${YQ}" ]] || [[ $(${YQ} --version | sed -E "s/.*version ([34]).*/\1/g") == "3" ]]; then
    echo "yq v4 is required"
    exit 1
  fi

  if ! command -v jq 1> /dev/null 2> /dev/null; then
    echo "jq is required"
    exit 1
  fi

  CREDENTIALS_TFVARS="${TERRAFORM_DIR}/credentials.auto.tfvars"
  TERRAFORM_TFVARS="${TERRAFORM_DIR}/terraform.tfvars"

  function process_variable () {
    local name="$1"
    local default_value="$2"
    local sensitive="$3"
    local description="$4"
    local prompt_all="$5"

    local variable_name="TF_VAR_${name}"

    if env | grep -q "${variable_name}"; then
      environment_variable=$(env | grep "${variable_name}" | sed -E 's/.*=(.*).*/\1/g')
    else
      environment_variable="null"
    fi

    value="${environment_variable}"
    if [[ "${sensitive}" == "true" ]] && [[ -f "${CREDENTIALS_FILE}" ]]; then
      value=$(cat "${CREDENTIALS_FILE}" | NAME="${name}" ${YQ} e -o json '.variables[] | select(.name == env(NAME)) | .value' - | jq -c -r '.')
      if [[ -z "${value}" ]]; then
        value="${environment_variable}"
      fi
    elif [[ "${sensitive}" != "true" ]] && [[ -f "${VARIABLES_FILE}" ]]; then
      value=$(cat "${VARIABLES_FILE}" | NAME="${name}" ${YQ} e -o json '.variables[] | select(.name == env(NAME)) | .value' - | jq -c -r '.')
      if [[ -z "${value}" ]]; then
        value="${environment_variable}"
      fi
    fi

    if [[ "${value}" == "null" ]] && [[ "${prompt_all}" != "true" ]]; then
      value="${default_value}"
    fi

    while [[ "${value}" == "null" ]]; do
      echo "Provide a value for '${name}':"
      if [[ -n "${description}" ]]; then
        echo "  ${description}"
      fi
      sensitive_flag=""
      if [[ "${sensitive}" == "true" ]]; then
        sensitive_flag="-s"
      fi
      default_prompt=""
      if [[ "${default_value}" != "null" ]]; then
        default_prompt="(${default_value}) "
      fi
      read -u 1 ${sensitive_flag} -p "> ${default_prompt}" value
      value=${value:-$default_value}
    done

    output_value=$(echo "${value}" | sed 's/"/\\"/g')

    if [[ "${sensitive}" != "true" ]]; then
      echo "${name} = \"${output_value}\"" >> "${TERRAFORM_TFVARS}"
      if [[ -z "${value}" ]]; then
        NAME="${name}" VALUE="${value}" ${YQ} e -i -P '.variables += [{"name": env(NAME), "value": ""}]' "${TMP_VARIABLES_FILE}"
      else
        NAME="${name}" VALUE="${value}" ${YQ} e -i -P '.variables += [{"name": env(NAME), "value": env(VALUE)}]' "${TMP_VARIABLES_FILE}"
      fi
    else
      echo "${name} = \"${output_value}\"" >> "${CREDENTIALS_TFVARS}"
      if [[ -z "${value}" ]]; then
        NAME="${name}" VALUE="${value}" ${YQ} e -i -P '.variables += [{"name": env(NAME), "value": ""}]' "${TMP_CREDENTIALS_FILE}"
      else
        NAME="${name}" VALUE="${value}" ${YQ} e -i -P '.variables += [{"name": env(NAME), "value": env(VALUE)}]' "${TMP_CREDENTIALS_FILE}"
      fi
    fi
  }

  if [[ ! -f "${TERRAFORM_TFVARS}" ]] && [[ ! -f "${CREDENTIALS_TFVARS}" ]]; then

    touch "${TERRAFORM_TFVARS}"
    touch "${CREDENTIALS_TFVARS}"

    if [[ ! -f "${VARIABLES_FILE}" ]]; then
      echo "Variables can be provided in a yaml file passed as the first argument"
      echo ""
    fi

    TMP_VARIABLES_FILE="${VARIABLES_FILE}.tmp"
    TMP_CREDENTIALS_FILE="${CREDENTIALS_FILE}.tmp"

    echo "variables: []" > ${TMP_VARIABLES_FILE}
    echo "variables: []" > ${TMP_CREDENTIALS_FILE}

    cat "bom.yaml" | ${YQ} e '.spec.variables[] | .name' - | while read name; do
      variable=$(cat "bom.yaml" | NAME="${name}" ${YQ} e '.spec.variables[] | select(.name == env(NAME))' -)

      default_value=$(echo "${variable}" | ${YQ} e -o json '.value' - | jq -c -r '.')
      sensitive=$(echo "${variable}" | ${YQ} e '.sensitive // false' -)
      description=$(echo "${variable}" | ${YQ} e '.description // ""' -)

      process_variable "${name}" "${default_value}" "${sensitive}" "${description}" "${PROMPT_ALL}"
    done

    if [[ -f "${VARIABLES_FILE}" ]]; then
      cat "${VARIABLES_FILE}" | ${YQ} e '.variables[]' -o json - | jq -c '.' | while read var; do
        name=$(echo "${var}" | jq -r '.name')

        value=$(echo "${var}" | jq -r '.value // empty')
        sensitive=$(echo "${var}" | jq -r '.sensitive')

        bom_var=$(cat bom.yaml | ${YQ} e '.spec.variables[]' -o json - | jq --arg NAME "${name}" -c 'select(.name == $NAME)')

        if [[ -z "${bom_var}" ]]; then
          process_variable "${name}" "${value}" "${sensitive}" "" "${PROMPT_ALL}"
        fi
      done
    fi

    cp "${TMP_VARIABLES_FILE}" "${VARIABLES_FILE}"
    rm "${TMP_VARIABLES_FILE}"

    cp "${TMP_CREDENTIALS_FILE}" "${CREDENTIALS_FILE}"
    rm "${TMP_CREDENTIALS_FILE}"
  fi

  cd "${TERRAFORM_DIR}" || exit 1
  terraform init
  terraform apply -auto-approve
fi
