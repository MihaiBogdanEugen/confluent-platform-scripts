#!/usr/bin/env bash

kubectl apply -f 10_zookeeper-configmap.yml
kubectl apply -f 12_zookeeper-service.yml
kubectl apply -f 13_zookeeper-statefulset.yml