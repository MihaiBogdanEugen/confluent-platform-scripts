#!/usr/bin/env bash

kubectl delete pods,services,configmaps,poddisruptionbudgets,deployments,statefulsets \
    -l category=schema-registry \
    --include-uninitialized