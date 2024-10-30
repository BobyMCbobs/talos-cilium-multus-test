#!/usr/bin/env bash

set -x

until kustomize build cluster | kubectl --kubeconfig ./clusterconfig/kubeconfig apply -f-; do sleep 1; done
