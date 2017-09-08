#!/usr/bin/env bash

docker-machine create --driver virtualbox --virtualbox-memory 6000 --virtualbox-cpu-count 2 default
eval $(docker-machine env default)