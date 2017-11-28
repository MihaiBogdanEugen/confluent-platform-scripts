#!/usr/bin/env bash

kubectl delete pods,services,configmaps,poddisruptionbudgets,deployments,statefulsets \
    -l category=kafka \
    --include-uninitialized