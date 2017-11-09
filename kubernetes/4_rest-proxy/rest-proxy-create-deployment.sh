#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE apply -f rest-proxy-service.yml
kubectl --kubeconfig $CONFIG_FILE apply -f rest-proxy-ingress.yml
kubectl --kubeconfig $CONFIG_FILE apply -f rest-proxy-configmap.yml
kubectl --kubeconfig $CONFIG_FILE apply -f rest-proxy-poddisruptionbudget.yml
kubectl --kubeconfig $CONFIG_FILE apply -f rest-proxy-deployment.yml