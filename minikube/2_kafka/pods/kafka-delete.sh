#!/usr/bin/env bash

kubectl delete pods,services -l category=kafka --include-uninitialized