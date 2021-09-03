#!/usr/bin/env bash

# Inputs
SC_ENDPOINT=$1  # i.e. https://sc.sageit.org
SYNAPSE_TOKEN_FILE=$2  # Absolute path to the file containing the Synapse PAT (i.e. /Users/jsmith/tokens/synapse_oidc_token)
SYNAPSE_PAT=$(cat ${SYNAPSE_TOKEN_FILE})  # The Synapse Personal Access Token

# Endpoints
STS_TOKEN_ENDPOINT="${SC_ENDPOINT}/ststoken"

# Get Credentials
AWS_STS_CREDS=$(curl --location-trusted --silent -H "Authorization:Bearer ${SYNAPSE_PAT}"  ${STS_TOKEN_ENDPOINT})

echo ${AWS_STS_CREDS}