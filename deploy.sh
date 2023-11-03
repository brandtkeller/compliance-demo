#!/bin/bash

## Expectation is that the bundle was already built and copied to the target instance

## install uds cli
curl -LO https://github.com/defenseunicorns/uds-cli/releases/download/v0.0.5-alpha/uds-cli_v0.0.5-alpha_Linux_amd64

echo "Install the bundle with 'uds bundle deploy uds-bundle-uds-sso-amd64-*.tar.zst --confirm'"
