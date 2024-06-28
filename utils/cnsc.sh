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

TYPE_SPEED=20

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
