#!/usr/bin/env bash

for kafka_pod in `kubectl get pods -l app=kfk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  for zookeeper_pod in `kubectl get pods -l app=zk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
    echo "Kafka running on pod $kafka_pod can connect to ZooKeeper running on pod $zookeeper_pod, that knows about the following brokers"    
    kubectl exec -it $kafka_pod -- bash -c "zookeeper-shell $zookeeper_pod:2181 <<<\"ls /brokers/ids\""
    echo "--------------------------------------------"      
  done
done

for pod in `kubectl get pods -l app=kfk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  echo "Kafka running on pod $pod knows about"
  kubectl exec -it $pod -- bash -c "kafka-run-class kafka.admin.BrokerApiVersionsCommand --bootstrap-server localhost:9092 | grep kafka -c"
  echo "brokers"
  echo "--------------------------------------------"
done