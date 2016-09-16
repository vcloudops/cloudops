#!/bin/bash
echo $(date) " - Starting Script"
sudo docker run --rm  --name ucp -v /var/run/docker.sock:/var/run/docker.sock  docker/ucp:1.1.0 id 1 > /tmp/id
INSTANCEID=$(cat /tmp/id)
sudo docker run --rm -i --name ucp -v /var/run/docker.sock:/var/run/docker.sock docker/ucp restore --root-ca-only --passphrase ddconazure --id $(cat /tmp/id) < /tmp/backup.tar
