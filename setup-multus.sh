#!/usr/bin/env bash

set -x

kubectl --kubeconfig ./clusterconfig/kubeconfig apply -f ./networkattachmentdefinition.yaml