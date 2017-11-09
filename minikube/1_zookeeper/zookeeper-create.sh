#!/usr/bin/env bash

kubectl apply -f zookeeper1-service.yml
kubectl apply -f zookeeper2-service.yml
kubectl apply -f zookeeper3-service.yml
kubectl apply -f zookeeper1-pod.yml
kubectl apply -f zookeeper2-pod.yml
kubectl apply -f zookeeper3-pod.yml
