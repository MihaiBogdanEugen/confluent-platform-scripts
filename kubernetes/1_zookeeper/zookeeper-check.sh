#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

for pod in `kubectl --kubeconfig $CONFIG_FILE --namespace=confluent-platform get pods -l app=zk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  echo "ZooKeeper running on pod $pod is in"
    kubectl --kubeconfig $CONFIG_FILE --namespace=confluent-platform exec -it $pod -- bash -c "echo stat | nc localhost 2181 | grep Mode"
  echo "---------------------------------------------"  
done