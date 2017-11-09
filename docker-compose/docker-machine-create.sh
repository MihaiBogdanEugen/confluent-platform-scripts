#!/usr/bin/env bash

docker-machine create --driver virtualbox --virtualbox-memory 6000 --virtualbox-cpu-count 2 confluent-platform
docker-machine env confluent-platform
eval $(docker-machine env confluent-platform)