#!/usr/bin/env bash

# Install AWS CLI v2
mkdir -p /tmp/awscliv2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2/awscliv2.zip"
pushd /tmp/awscliv2 && unzip ./awscliv2.zip && sudo ./aws/install && popd

# Install SSM session manager plugin
mkdir -p /tmp/ssm
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "/tmp/ssm/sessionmanager-bundle.zip"
pushd /tmp/ssm && unzip ./sessionmanager-bundle.zip && sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin && popd

