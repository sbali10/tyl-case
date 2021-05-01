#/bin/bash

sudo ansible-playbook -i inventory.ini  main.yaml --become --become-user=root -v
