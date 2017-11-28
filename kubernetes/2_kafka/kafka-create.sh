#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE apply -f 20_kafka-configmap.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 21_kafka-poddisruptionbudget.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 22_kafka-service.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 23_kafka-statefulset.yml