#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Must pass kubeconfig file as 1st arg'
    exit 0
fi

CONFIG_FILE=$1

for kafka_pod in `kubectl --kubeconfig $CONFIG_FILE --namespace=confluent-platform get pods -l app=kfk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  for zookeeper_pod in `kubectl --kubeconfig $CONFIG_FILE --namespace=confluent-platform get pods -l app=zk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
    echo "Kafka running on pod $kafka_pod can connect to ZooKeeper running on pod $zookeeper_pod, that knows about the following brokers"    
    kubectl --kubeconfig $CONFIG_FILE --namespace=confluent-platform exec -it $kafka_pod -- bash -c "zookeeper-shell $zookeeper_pod:2181 <<<\"ls /brokers/ids\""
    echo "--------------------------------------------"      
  done
done

for pod in `kubectl --kubeconfig $CONFIG_FILE --namespace=confluent-platform get pods -l app=kfk -o json | jq -r '[.items[].metadata.name]' | jq .[] | tr -d '"'`; do
  echo "Kafka running on pod $pod knows about"
    kubectl --kubeconfig $CONFIG_FILE --namespace=confluent-platform exec -it $pod -- bash -c "kafka-run-class kafka.admin.BrokerApiVersionsCommand --bootstrap-server localhost:9092 | grep kafka -c"
  echo "brokers"
  echo "--------------------------------------------"
done