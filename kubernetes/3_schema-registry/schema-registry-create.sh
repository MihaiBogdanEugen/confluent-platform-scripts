#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE apply -f 30_schema-registry-configmap.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 31_schema-registry-poddisruptionbudget.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 32_schema-registry-service.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 33_schema-registry-statefulset.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 34_schema-registry-ingress.yml