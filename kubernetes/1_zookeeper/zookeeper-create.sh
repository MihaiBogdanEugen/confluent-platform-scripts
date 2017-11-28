#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

kubectl --kubeconfig $CONFIG_FILE apply -f 10_zookeeper-configmap.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 11_zookeeper-poddisruptionbudget.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 12_zookeeper-service.yml
kubectl --kubeconfig $CONFIG_FILE apply -f 13_zookeeper-statefulset.yml