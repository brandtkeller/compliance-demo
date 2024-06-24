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
. ../utils/demo-magic.sh


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

## Note the empty environment
pe "ls -al"
TYPE_SPEED=100
# get the catalog
p "curl -LO https://raw.githubusercontent.com/usnistgov/oscal-content/master/nist.gov/SP800-53/rev5/json/NIST_SP-800-53_rev5_catalog.json"
cp ../utils/NIST_SP-800-53_rev5_catalog.json .


TYPE_SPEED=13

# generate a component definition file for the service mesh
pe "lula generate component -c file://./NIST_SP-800-53_rev5_catalog.json --component 'service mesh' -r ac-4,ac-4.4,ac-4.21,ac-6.3,ac-6.9,au-2,au-3 -o component.yaml"


TYPE_SPEED=100
p "System Message: Add these links to your OSCAL:\n links:\n\t- href: 'file://./validation.yaml'\n\t\trel: lula"

TYPE_SPEED=20
# Copy and review the validation
pe "cp ../utils/validation.yaml ."

pe "kubectl get pods -A"

pe "lula validate -f component.yaml -o assessment.yaml"

pe "lula validate -f component.yaml -o assessment.yaml"

pe "lula evaluate -f assessment.yaml"

pe "kubectl run mission-app-drift -n mission --image=docker.io/nginx:1.27.0 -l 'sidecar.istio.io/inject=false'"

pe "kubectl get pods -A"

pe "lula validate -f component.yaml -o assessment.yaml"

pe "lula evaluate -f assessment.yaml"

pe "kubectl delete po mission-app-drift -n mission"

pe "lula validate -f component.yaml -o assessment.yaml"

pe "lula evaluate -f assessment.yaml"
