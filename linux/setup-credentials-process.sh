#!/usr/bin/env bash

# Inputs
SC_ENDPOINT=$1         # i.e. https://sc.sageit.org
SYNAPSE_TOKEN_FILE=$2  # Absolute path to file containing Synapse PAT

CURRENT_DIR=$(pwd)
CURRENT_USER=$(whoami)
USER_DIR=/Users/${CURRENT_USER}
AWS_CONFIG_DIR=${USER_DIR}/.aws

cp ${CURRENT_DIR}/synapse_creds.sh ${AWS_CONFIG_DIR}/synapse_creds.sh
chmod +x ${AWS_CONFIG_DIR}/synapse_creds.sh

# Create or configure the AWS CLI profile
AWS_CONFIG_FILE=${AWS_CONFIG_DIR}/config
PROFILE=$(echo "
[profile service-catalog]
region=us-east-1
credential_process = \"${AWS_CONFIG_DIR}/synapse_creds.sh\" \"${SC_ENDPOINT}\" \"${SYNAPSE_TOKEN_FILE}\""
)

if [ -f "${AWS_CONFIG_FILE}" ]; then
  echo "Append this profile to your AWS CLI configurations in ${AWS_CONFIG_FILE}"
  echo "${PROFILE}"
else
  mkdir -p ${AWS_CONFIG_DIR}
  echo "${PROFILE}" > ${AWS_CONFIG_FILE}
fi
