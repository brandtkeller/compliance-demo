#!/bin/bash

# setup uds
curl -LO https://github.com/defenseunicorns/uds-cli/releases/download/v0.0.5-alpha/uds-cli_v0.0.5-alpha_Linux_amd64
sudo chmod +x uds-cli_v0.0.5-alpha_Linux_amd64
sudo mv uds-cli_v0.0.5-alpha_Linux_amd64 /usr/local/bin/uds

# setup zarf
curl -LO https://github.com/defenseunicorns/zarf/releases/download/v0.31.0/zarf_v0.31.0_Linux_amd64
sudo chmod +x zarf_v0.31.0_Linux_amd64
sudo mv zarf_v0.31.0_Linux_amd64 /usr/local/bin/zarf

# Create bundle
cd bundle && uds bundle create --set INIT_VERSION=v0.29.2 --set METALLB_VERSION=0.0.1 --set DUBBD_VERSION=0.11.0 --set IDAM_VERSION=0.1.12 --set SSO_VERSION=0.1.7 --confirm

# Deploy bundle
uds bundle deploy uds-bundle-uds-sso-amd64-*.tar.zst --confirm