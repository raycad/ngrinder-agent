# NGrinder Agent

You should run your agent on different physical/virtual machine from the one where the controller is running since dockers running on the same machine cannot communicate each other without having to use an additional docker networking solution. In addition, agents might consume full resource on the machine to generate loads, so we strongly recommend to run nGrinder agent containers on the physically different machines from the one where controller is installed.

### 1. Pull the NGrinder Agent image
```
$ sudo docker pull seedotech/ngrinder-agent:3.4.2
```

### 2. Create and run docker container

```sh
# Enter the host's IP of the NGRINDER Controller container
$ sudo docker run -itd \
					-e NGRINDER_CONTROLLER_IP=$NGRINDER_CONTROLLER_IP \
					-e NGRINDER_CONTROLLER_PORT=$NGRINDER_CONTROLLER_PORT \
					--name ngrinder-agent \
					--hostname ngrinder-agent \
					seedotech/ngrinder-agent:3.4.2 &> /dev/null

OR
$ ./start_containers.sh NGRINDER_CONTROLLER_IP NGRINDER_CONTROLLER_PORT

E.g:
$ docker run -itd -e NGRINDER_CONTROLLER_IP=10.221.71.28 -e NGRINDER_CONTROLLER_PORT=16001 --name ngrinder-agent --hostname ngrinder-agent seedotech/ngrinder-agent:3.4.2 &> /dev/null

# If you want to use controller & agent in the same physical machine, create as follows:
$ sudo docker run -itd \
					--net=ngrinder \
					-e NGRINDER_CONTROLLER_IP=$NGRINDER_CONTROLLER_IP \
					-e NGRINDER_CONTROLLER_PORT=$NGRINDER_CONTROLLER_PORT \
					--name ngrinder-agent \
					--hostname ngrinder-agent \
					seedotech/ngrinder-agent:3.4.2 &> /dev/null

E.g:
$ docker run -itd --net=ngrinder -e NGRINDER_CONTROLLER_IP=10.221.71.28 -e NGRINDER_CONTROLLER_PORT=16001 --name ngrinder-agent --hostname ngrinder-agent seedotech/ngrinder-agent:3.4.2 &> /dev/null
```

### 3. Get into the ngrinder agent container
```
$ sudo docker exec -it ngrinder-agent bash
```
