#!/usr/bin/env bash

set -x

helm repo add cilium https://helm.cilium.io/ --force-update

helm --kubeconfig ./clusterconfig/kubeconfig upgrade --install -n kube-system \
  cilium cilium/cilium \
  --set ipam.mode=kubernetes \
  --set securityContext.capabilities.ciliumAgent='{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}' \
  --set securityContext.capabilities.cleanCiliumState='{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}' \
  --set cgroup.autoMount.enabled=false \
  --set cgroup.hostRoot=/sys/fs/cgroup \
  --set k8sServiceHost=localhost \
  --set k8sServicePort=7445 \
  --set socketLB.hostNamespaceOnly=true \
  --set cni.exclusive=false
