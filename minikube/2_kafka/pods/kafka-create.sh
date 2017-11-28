#!/usr/bin/env bash

kubectl apply -f kafka1-service.yml
kubectl apply -f kafka2-service.yml
kubectl apply -f kafka3-service.yml
kubectl apply -f kafka4-service.yml
kubectl apply -f kafka5-service.yml
kubectl apply -f kafka1-pod.yml
kubectl apply -f kafka2-pod.yml
kubectl apply -f kafka3-pod.yml
kubectl apply -f kafka4-pod.yml
kubectl apply -f kafka5-pod.yml
