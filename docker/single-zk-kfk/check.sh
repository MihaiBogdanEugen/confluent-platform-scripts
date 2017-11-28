#!/usr/bin/env bash

for i in 2181; do
  echo "ZooKeeper instance listening on port $i:"
  docker run --net=host --rm mbe1224/confluent-zookeeper bash -c "echo ruok | nc localhost $i"
  echo ""
  docker run --net=host --rm mbe1224/confluent-zookeeper bash -c "echo stat | nc localhost $i | grep Mode"
  echo "---------------------------------------------"
done

for j in 9092; do
  echo "Kafka broker listening on port $j knows about"
  docker run --net=host --rm mbe1224/confluent-kafka bash -c "kafka-run-class kafka.admin.BrokerApiVersionsCommand --bootstrap-server localhost:$j | grep localhost -c"
  echo "brokers"
  echo "--------------------------------------------"
done

for i in 2181; do
  echo "ZooKeeper instance listening on port $i knows about the following Kafka brokers:"
  docker run --net=host --rm mbe1224/confluent-zookeeper bash -c "echo dump | nc localhost $i | grep broker"
  echo "---------------------------------------------"
done
