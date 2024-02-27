#!/bin/sh
# file: push_to_local_registry.sh
set -e

# Add entry to hosts file if not present
if ! grep -q "127.0.0.1   registry" /etc/hosts; then
  echo "127.0.0.1   registry" | sudo tee -a /etc/hosts
fi

# Tag and push the image to the local registry
echo "entrypoint.sh - Tagging"
docker tag kindest/node:v1.29.2 registry:5000/kindest/node:v1.29.2
docker tag hashicorp/terraform:1.7.4 registry:5000/hashicorp/terraform:1.7.4
docker tag alpine/helm:3.14.2 registry:5000/alpine/helm:3.14.2
docker push registry:5000/kindest/node:v1.29.2
docker push registry:5000/hashicorp/terraform:1.7.4
docker push registry:5000/alpine/helm:3.14.2
