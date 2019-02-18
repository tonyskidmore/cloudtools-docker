#!/bin/bash

eval $(ssh-agent -s)
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null

cd /playbooks

ansible-playbook $ANSIBLE_PLAYBOOK --extra-vars "target=$ANSIBLE_TARGET"
