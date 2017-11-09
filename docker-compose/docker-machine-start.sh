#!/usr/bin/env bash

docker-machine start confluent-platform
docker-machine env confluent-platform
eval $(docker-machine env confluent-platform)