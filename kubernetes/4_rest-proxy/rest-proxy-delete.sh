#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE \
    --namespace=confluent-platform \
    delete pods,services,configmaps,poddisruptionbudgets,deployments,statefulsets \
    -l category=rest-proxy \
    --include-uninitialized