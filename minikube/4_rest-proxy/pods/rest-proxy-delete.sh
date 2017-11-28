#!/usr/bin/env bash

kubectl delete pods,services -l category=rest-proxy --include-uninitialized