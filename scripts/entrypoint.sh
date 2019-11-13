#!/bin/bash

# eval $(ssh-agent -s)
# echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null

cd /playbooks

git clone https://github.com/tonyskidmore/cloudtools-content.git

ls cloudtools-content/
echo $ANSIBLE_PLAYBOOK

ansible-playbook $ANSIBLE_PLAYBOOK $ANSIBLE_PARAMS -i /inventory
