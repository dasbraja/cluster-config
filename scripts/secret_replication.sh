#!/bin/bash

SOURCE_NAMESPACE="cluster-config"
TARGET_NAMESPACE="agent"
SECRET_NAME="flux-system"

kubectl get secret $SECRET_NAME -n $SOURCE_NAMESPACE -o yaml | \
  sed "s/namespace: $SOURCE_NAMESPACE/namespace: $TARGET_NAMESPACE/" | \
  kubectl apply -n $TARGET_NAMESPACE -f -
