# NGrinder Agent

### 1. Pull the image
```
$ sudo docker pull seedotech/ngrinder-agent:3.4.2
```

### 2. Create a ngrinder network
```
$ sudo docker network create --driver=bridge ngrinder
```

### 3. Create and run docker container

```sh
# Enter the host's IP of the NGRINDER Controller container
$ sudo docker run -itd \
					-p 13243:13243 \
					-e NGRINDER_CONTROLLER_IP=$NGRINDER_CONTROLLER_IP \
					-e NGRINDER_CONTROLLER_PORT=$NGRINDER_CONTROLLER_PORT \
					--name ngrinder-agent \
					--hostname ngrinder-agent \
					seedotech/ngrinder-agent:3.4.2 &> /dev/null

OR
$ ./start_containers.sh NGRINDER_CONTROLLER_IP NGRINDER_CONTROLLER_PORT
```

### 4. Get into the ngrinder agent container
```
$ sudo docker exec -it ngrinder-agent bash
```
