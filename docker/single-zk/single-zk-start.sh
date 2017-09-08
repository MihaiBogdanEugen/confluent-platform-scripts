#!/usr/bin/env bash

docker run -d \
    --net=host \
    --name=zk \
    -e ZOOKEEPER_CLIENT_PORT=2181 \
    mbe1224/confluent-osp-zookeeper