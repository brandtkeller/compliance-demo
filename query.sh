#!/bin/bash

function kubectlgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found ${i}
  done
}

for i in $(kubectl get ns -o name | grep -v "kube-system" | grep -v "default" | grep -v "kube-public" | grep -v "kube-node-lease" | sort | uniq); do
  NS=$(echo $i | cut -d "/" -f 2)
  echo $NS
  kubectlgetall $NS
  echo ""
done