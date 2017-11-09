#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE apply -f schema-registry-service.yml
kubectl --kubeconfig $CONFIG_FILE apply -f schema-registry-ingress.yml
kubectl --kubeconfig $CONFIG_FILE apply -f schema-registry-configmap.yml
kubectl --kubeconfig $CONFIG_FILE apply -f schema-registry-poddisruptionbudget.yml
kubectl --kubeconfig $CONFIG_FILE apply -f schema-registry-deployment.yml