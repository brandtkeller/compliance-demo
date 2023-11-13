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
p "kubectl get po -A"

## Show the available component files
pei "ls -l ../components"

## Target a single component file
pe "cat ../components/monitoring.yaml"

## Validate the single component file
p "lula validate ../components/monitoring.yaml"

## Review the assessment
p "cat assessment-results*.yaml"

## Remove the assessment
rm assessment-results*.yaml

## Now discuss the platform as a collection of components
pe "cat platform.yaml"

## Aggregation of components
pe "cat oscal-component.yaml"

## Validate the whole platform
p "lula validate oscal-component.yaml"

## Review the assessment
p "cat assessment-results*.yaml"

## Remove the assessment
rm assessment-results*.yaml

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""