#!/bin/bash
docker run \
--env AZURE_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID} \
--env AZURE_CLIENT_ID=${AZURE_CLIENT_ID} \
--env AZURE_SECRET=${AZURE_SECRET} \
--env AZURE_TENANT=${AZURE_TENANT} \
--env ARM_CLIENT_ID=${AZURE_CLIENT_ID} \
--env ARM_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID} \
--env ARM_TENANT_ID=${AZURE_TENANT} \
--env ARM_CLIENT_SECRET=${AZURE_SECRET} \
--env ANSIBLE_TARGET="build_1" \
--env ANSIBLE_USER="cloud_user" \
--env ANSIBLE_PLAYBOOK="test.yml" \
--env ANSIBLE_PARAMS="" \
--env SSH_PRIVATE_KEY="${SSH_PRIVATE_KEY}" \
--rm \
--name cloudtools \
cloud-tools:latest
