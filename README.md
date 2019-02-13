# NGrinder Agent

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
```

### 3. Get into the ngrinder agent container
```
$ sudo docker exec -it ngrinder-agent bash
```
