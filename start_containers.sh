#!/bin/bash

sudo docker run -itd \
					--net=ngrinder \
					--name ngrinder-agent \
					--hostname ngrinder-agent \
					seedotech/ngrinder-agent:3.4.2 &> /dev/null