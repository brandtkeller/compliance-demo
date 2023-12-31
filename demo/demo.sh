#!/usr/bin/env bash

#################################
# include the -=magic=-
# you can pass command line args
#
# example:
# to disable simulated typing
# . ../demo-magic.sh -d
#
# pass -h to see all options
#################################
. ../demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"

# text color
# DEMO_CMD_COLOR=$BLACK

# hide the evidence
clear

## Show the live environment
pe "kubectl get po -A"

## Show the available component files
pe "ls -l ../components"

## Target a single component file
p "cat ../components/istio.yaml"
cat ../components/istio.yaml | yq

pe "cat ../components/istio.yaml | yq '.component-definition.metadata'"

pe "cat ../components/istio.yaml | yq '.component-definition.components[0].control-implementations[0].implemented-requirements[1]'"

pe "cat ../components/istio.yaml | yq '.component-definition.back-matter'"
## Validate the single component file
pe "lula validate ../components/istio.yaml"

## Review the assessment
p "cat assessment-results*.yaml"
cat assessment-results*.yaml | yq
## Remove the assessment
rm assessment-results*.yaml

## Now discuss the platform as a collection of components
p "cat platform.yaml"
cat platform.yaml | yq
p "component-generator aggregate -i platform.yaml"

## Aggregation of components
pe "cat oscal-component.yaml"
cat oscal-component.yaml | yq
## Validate the whole platform
pe "lula validate oscal-component.yaml"

## Review the assessment
p "cat assessment-results*.yaml"
cat assessment-results*.yaml | yq
## Remove the assessment
rm assessment-results*.yaml

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""