# compliance-demo

## Goal
Demonstrate Lula validating against a live environment and validating multiple components of a system in a single execution.

## General Thoughts

Document reproducible deployment for DUBBD + UDS IDAM + UDS SSO

OSCAL
- Grab Copies for all/some of the associated deployment packages
- Create a component-generator manifest for the file aggregation
- Begin to fill out individual component definitions with baseline Kubernetes validation
- Loop
  - Test - iterate - test

## Reproducible Deployment
- Create EC2 instance w/ k3d (Big Bang Dev script currently)
- Clone this repository
- ./build-and-deploy.sh