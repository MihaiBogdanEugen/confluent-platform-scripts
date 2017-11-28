#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE apply -f 40_rest-proxy-configmap.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 41_rest-proxy-poddisruptionbudget.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 42_rest-proxy-service.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 43_rest-proxy-statefulset.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 44_rest-proxy-ingress.yml