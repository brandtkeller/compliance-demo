# compliance-demo

## Goal
Demonstrate Lula validating against a live environment and validating multiple components of a system in a single execution.

## General Thoughts

Document reproducible deployment for DUBBD + UDS IDAM + UDS SSO

OSCAL
- &check; Grab Copies for all/some of the associated deployment packages
- Grab/create UDS-IDAM and UDS-SSO OSCAL
- Create a component-generator manifest for the file aggregation
- Begin to fill out individual component definitions with baseline Kubernetes validation
  - istio
  - kiali
  - kyverno
  - loki
  - monitoring
  - neuvector
  - promtail
  - tempo
  - keycloak
  - authservice

## Reproducible Deployment
- Create EC2 instance w/ k3d (Big Bang Dev script currently)
  - [k3d-dev.sh](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/assets/scripts/developer/k3d-dev.sh?ref_type=heads)
- Clone this repository to your remote instance
- ./build-and-deploy.sh

## Notes
- Using the `0.0.5` of UDS CLI to match uds-sso repository dependency 