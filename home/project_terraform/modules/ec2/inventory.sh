#!/bin/bash
echo "[all]" > /home/project_ansible/inventory

aws ec2 describe-instances \
    --query 'Reservations[*].Instances[*].[PublicIpAddress]' \
        --output text | while read ip; do
                echo "$ip ansible_user=ec2-user ansible_ssh_private_key_file=/home/project_ansible/project_key.pem"
                    done >> /home/project_ansible/inventory
