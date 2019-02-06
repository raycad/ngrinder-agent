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
sudo docker run -itd \
					--net=ngrinder \
					--name ngrinder-agent \
					--hostname ngrinder-agent \
					seedotech/ngrinder-agent:3.4.2 &> /dev/null

OR
$ ./start_containers.sh                    
```

### 4. Get into the ngrinder agent container
```
$ sudo docker exec -it ngrinder-agent bash
```
