#!/usr/bin/env bash

kubectl delete pods,services -l category=schema-registry --include-uninitialized