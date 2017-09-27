#!/usr/bin/env bash

for i in 12181 22181 32181; do
  echo "ZooKeeper instance listening on port $i is in"
  docker run --net=host --rm mbe1224/confluent-osp-zookeeper bash -c "echo stat | nc localhost $i | grep Mode"
  echo "---------------------------------------------"
done