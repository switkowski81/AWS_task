#!/bin/bash

# Aktualizacja inventory
/home/project_terraform/modules/ec2/inventory.sh

# Uruchomienie playbooka Ansible na wszystkich instancjach
ansible-playbook -i /home/project_ansible/inventory /home/project_ansible/playbook.yml
