#!/usr/bin/env bash

for pod in `kubectl get pods -l app=zk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  echo "ZooKeeper running on pod $pod:"
  kubectl exec -it $pod -- bash -c "echo ruok | nc localhost 2181"
  echo ""
  kubectl exec -it $pod -- bash -c "echo stat | nc localhost 2181 | grep Mode"
  echo "---------------------------------------------"  
done