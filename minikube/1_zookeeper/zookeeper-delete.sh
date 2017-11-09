#!/usr/bin/env bash

kubectl delete pods,services -l category=zookeeper --include-uninitialized