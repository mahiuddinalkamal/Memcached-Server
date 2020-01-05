#!/bin/bash

sudo docker-compose up -d
ssh ubuntu@127.0.0.1 -p 10022 "./run.sh"
scp -P 10022 ubuntu@127.0.0.1:~/graph*.pdf .
evince graph*.pdf
sudo docker-compose down
