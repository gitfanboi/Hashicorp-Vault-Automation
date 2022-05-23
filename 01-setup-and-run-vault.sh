#!/bin/bash

docker-compose down
sudo rm -rf vault/data/

docker-compose up --build -d

cd ansible && ansible-playbook configure-vault.yml -e "@./build-vars.yml"

