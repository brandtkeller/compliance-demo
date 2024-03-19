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
pe "kubectl get hr -A"

## Show the available component files
pe "ls -l ../components"

## Target a single component file
p "cat ../components/istio.yaml"
cat ../components/istio.yaml | yq

pe "cat ../components/istio.yaml | yq '.component-definition.metadata'"

pe "cat ../components/istio.yaml | yq '.component-definition.components[0].control-implementations[0].implemented-requirements[1]'"

pe "cat ../components/istio.yaml | yq '.component-definition.back-matter'"
## Validate the single component file
pe "lula validate -f ../components/istio.yaml -a assessment-one.yaml" 

## Review the assessment
pe "cat assessment-one.yaml | grep 'target-id: ac-4' -B 5"

## Now inject some madness
pe "kubectl create ns test"
pe "kubectl run imperative-pod --image=docker.io/nginx:1.23.2 -l 'sidecar.istio.io/inject=false' -n test"

## Now run validation two
pe "lula validate -f ../components/istio.yaml -a assessment-two.yaml"

## Review the assessment
pe "cat assessment-two.yaml | grep 'target-id: ac-4' -B 5"


## Evaluate
pe "lula evaluate -f assessment-one.yaml -f assessment-two.yaml"

pe "kubectl delete pod imperative-pod -n test"
pe "kubectl delete ns test"


## Now discuss the platform as a collection of components
p "cat platform.yaml"
cat platform.yaml | yq
p "component-generator aggregate -i platform.yaml"

## Aggregation of components
pe "cat oscal-component.yaml"
cat oscal-component.yaml | yq
pe "cat oscal-component.yaml | wc -l"
## Validate the whole platform
pe "lula validate -f oscal-component.yaml -a assessment-platform.yaml"

## Review the assessment
p "cat assessment-platform.yaml"
cat assessment-platform.yaml | yq

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""