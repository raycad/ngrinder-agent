#!/bin/bash

# Set the 1st argument as the host's IP of the NGRINDER CONTROLLER container
NGRINDER_CONTROLLER_IP=${1}
if [$NGRINDER_CONTROLLER_IP == ""]; then 
	echo "You must enter the host's IP of the NGRINDER CONTROLLER container!!!"
	exit
fi

NGRINDER_CONTROLLER_PORT=${2:-16001}

echo "NGRINDER_CONTROLLER_IP =" $NGRINDER_CONTROLLER_IP
echo "NGRINDER_CONTROLLER_PORT =" $NGRINDER_CONTROLLER_PORT

# NGRINDER Monitor port number 13243
# Enter the host's IP of the NGRINDER Controller container
sudo docker run -itd \
					-p 13243:13243 \
					-e NGRINDER_CONTROLLER_IP=$NGRINDER_CONTROLLER_IP \
					-e NGRINDER_CONTROLLER_PORT=$NGRINDER_CONTROLLER_PORT \
					--name ngrinder-agent \
					--hostname ngrinder-agent \
					seedotech/ngrinder-agent:3.4.2 &> /dev/null