#!/bin/bash

echo -e "\nBuilding NGrinder Agent 3.4.2 docker image...\n"
sudo docker build -t seedotech/ngrinder-agent:3.4.2 .