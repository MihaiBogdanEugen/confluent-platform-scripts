#!/usr/bin/env bash

kubectl apply -f 40_rest-proxy-configmap.yml
kubectl apply -f 42_rest-proxy-service.yml
kubectl apply -f 43_rest-proxy-statefulset.yml