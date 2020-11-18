#!/usr/bin/env bash

# Install terraform
wget https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip
unzip terraform_0.13.4_linux_amd64.zip
chmod +x terraform
ls -l
cp terraform /usr/local/bin/terraform
terraform version
echo $PATH

# Install jq
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
mv jq-linux64 jq
chmod +x jq
