#!/usr/bin/env bash

for i in 12181 22181 32181; do
  echo "ZooKeeper instance listening on port $i is in"
  docker run --net=host --rm mbe1224/confluent-zookeeper bash -c "echo stat | nc localhost $i | grep Mode"
  echo "---------------------------------------------"
done

for j in 19092 29092 39092 49092 59092; do
  echo "Kafka broker listening on port $j know about"
  docker run --net=host --rm mbe1224/confluent-kafka bash -c "kafka-run-class kafka.admin.BrokerApiVersionsCommand --bootstrap-server localhost:$j | grep localhost -c"
  echo "brokers"
  echo "--------------------------------------------"
done