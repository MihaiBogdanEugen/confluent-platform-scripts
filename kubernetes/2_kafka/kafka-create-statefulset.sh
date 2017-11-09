#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE apply -f kafka-service.yml
kubectl --kubeconfig $CONFIG_FILE apply -f kafka-configmap.yml
kubectl --kubeconfig $CONFIG_FILE apply -f kafka-poddisruptionbudget.yml
kubectl --kubeconfig $CONFIG_FILE apply -f kafka-statefulset.yml