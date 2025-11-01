#!/bin/bash

# Paths
INVENTORY="/home/ansible/workspace/inventory/dev/hosts.ini"
GLOBAL_VARS="/home/ansible/workspace/inventory/dev/group_vars/all.yml"   # or globalvars/main.yml

# Extract global variables from YAML
ANSIBLE_USER=$(grep -E '^ansible_user:' "$GLOBAL_VARS" | awk '{print $2}')
ANSIBLE_KEY=$(grep -E '^ansible_ssh_private_key_file:' "$GLOBAL_VARS" | awk '{print $2}')
ANSIBLE_PORT=$(grep -E '^ansible_port:' "$GLOBAL_VARS" | awk '{print $2}')

# Default values if not found
ANSIBLE_USER=${ANSIBLE_USER:-ansible}
ANSIBLE_KEY=${ANSIBLE_KEY:-~/.ssh/id_rsa}
ANSIBLE_PORT=${ANSIBLE_PORT:-22}

echo "Global user: $ANSIBLE_USER"
echo "Global key: $ANSIBLE_KEY"
echo "Global port: $ANSIBLE_PORT"
echo ""

# Loop through active hosts
grep -E '^[^#\[]' "$INVENTORY" | while read -r line; do
    HOST=$(echo $line | awk '{print $1}')

    # Override user/key/port if defined in inventory line
    USER=$(echo $line | grep -oP 'ansible_user=\K\S+' || echo "$ANSIBLE_USER")
    PORT=$(echo $line | grep -oP 'ansible_port=\K\S+' || echo "$ANSIBLE_PORT")
    KEY=$(echo $line | grep -oP 'ansible_ssh_private_key_file=\K\S+' || echo "$ANSIBLE_KEY")

    echo "Copying SSH key to $USER@$HOST on port $PORT..."
    echo " ssh-copy-id -i $KEY -f $USER@$HOST "
    ssh-copy-id -i $KEY -f $USER@$HOST
done
