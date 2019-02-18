#!/bin/bash
docker run \
-it \
--env AZURE_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID} \
--env AZURE_CLIENT_ID=${AZURE_CLIENT_ID} \
--env AZURE_SECRET=${AZURE_SECRET} \
--env AZURE_TENANT=${AZURE_TENANT} \
--name ud \
--rm \
cloud-tools:latest \
/bin/bash
