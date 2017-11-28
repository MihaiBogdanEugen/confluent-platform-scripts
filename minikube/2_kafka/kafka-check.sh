#!/usr/bin/env bash

for pod in `kubectl get pods -l app=kfk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  echo "Kafka running on pod $pod knows about"
  kubectl exec -it $pod -- bash -c "kafka-run-class kafka.admin.BrokerApiVersionsCommand --bootstrap-server localhost:9092 | grep kfk -c"
  echo "brokers"
  echo "--------------------------------------------"
done

for pod in `kubectl get pods -l app=zk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  echo "ZooKeeper running on pod $pod knows about the following Kafka brokers:"
  kubectl exec -it $pod -- bash -c "echo dump | nc localhost 2181 | grep broker"
  echo "---------------------------------------------"  
done