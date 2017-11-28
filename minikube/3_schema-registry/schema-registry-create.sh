#!/usr/bin/env bash

kubectl apply -f 30_schema-registry-configmap.yml
kubectl apply -f 32_schema-registry-service.yml
kubectl apply -f 33_schema-registry-statefulset.yml