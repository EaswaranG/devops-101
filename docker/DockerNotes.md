# Getting started with docker
## Author Easwaran Govindarajan

Docker is a containerization tool. A container is an isolated environment, packaging application data and their dependencies.

In this example, I am creating a simple docker image and publishing to my docker hub and we will pull the image to a AWS EC2 instance and run the container.

My Docker base image was created in ARM architecture, so make sure to use appropriate VM.

## Docker 

Docker Hub is a container image repository, we could publish our images to the docker hub.
Docker is written in Go Language. 
URL : https://hub.docker.com/
My Image : https://hub.docker.com/repository/docker/easwarang/hello-python/general

## Docker Quick Notes
- Changes inside the image are not persistant.
- To do port forwarding to the container, we need to bind the VM port with the container port (eg: when i hit ip:8080, the request should be redirected to the port 80 of the container) `docker run -d -p 8080:80 <imageName>` -> Binds port 8080 of the local machine (or VM) with the port 80 of the docker.

## Docker Terms

namespace -> Isolates containers
cgroup -> Resource management (allocates resources to container)
union -> File system access to the container
docker daemon -> The actual docker engine (service) which runs the container
docker image -> The snapshot of the build
docker container -> Process running the docker iamge
docker file -> Set of instructions required to build docker image
Docker Hub -> Docker repository
Docker Compose -> Tool to create multiple containers from a yaml file
Docker Swarm -> Docker's native clustering and orchestration solution
Kubernetes -> An Open-Source and popular orchestration tool

## Set-up

Download docker and install.
 - GUI : `https://www.docker.com/products/docker-desktop/`
 - CLI for Mac : `brew install docker`
 - CLI for other linux : Refer your package manager instructions

## Steps to practice

- Create a python file in any folder ({home}/dockerPractice/hello-python.py), add your code to that.
- Create a docker file (Dockerfile) as name without extension, note this is case sensitive.
- Build the image
- Tag the image
- Run the image
- Push the image to the hub

## Commands

 - To view the information of the docker installed, execute `docker info`
 - To list the images installed, execute `docker images`
 - To build the docker image, execute `docker build -t appName:tagName .` Example: `docker build -t hello-python-app:latest .`
 - To create a tag to the docker image, execute `docker tag appName userName/folderName:tagName` Example: `docker tag hello-python-app easwarang/hello-python:latest`
 - To run the docker image, execute `docker run appName` Example: `docker run hello-python-app`
 - To login to the docker hub `docker login`
 - To push the docker image to hub, execute `docker push username/folderName:tagname` Example: `docker push easwarang/hello-python:latest`
 - To pull the docker image to hub, execute `docker pull uesrname/appName:tagname` Example: `docker pull easwarang/hello-python:latest`
 - `docker ps` -> lists running docker processes
 - `docker ps -a` -> lists all containers in any state
 - `docker container ls` -> returns running container (add -a to list in all state)
 - `docker rmi -f nginx` -> Removes an image from local
 - `docker run -d <imageName>` -> Runs the container in detached mode (background)
 - `docker run -d -p 8080:80 --name my-webserver nginx` -> Runs in detached moded in port 8080 and with name 'my-webserver'
 - `docker run --rm -d -p 8080:80 --name my-webserver nginx` -> Use --rm to automatically remove the container once stopped
 - `docker stop <containerId>` -> Stops a running container
 - `sudo docker build -t <imageName>:<tag> .` -> Builds a docker image from docker file in the current location (.)
 - `docker build -t db . -f Dockerfile_db` -> When a docker file name is different, use -f to specify the filename
 - `docker start <containerId>` -> Starts a exited container
 - `docker system prune -a` -> Purges all Unused or Dangling Images, Containers, Volumes, and Networks

 - To do port forwarding to the container, we need to bind the VM port with the container port (eg: when i hit ip:8080, the request should be redirected to the port 80 of the container) `docker run -d -p 8080:80 <imageName>` -> Binds port 8080 of the local machine (or VM) with the port 80 of the docker image.
 - To copy a file inside a container, `sudo docker cp <file name> <container ID>:<path>` 
  Example: `sudo docker cp index.html 152bf0e4eede:/usr/share/nginx/html/`
 - Create a docker image from a running container, create a new image with tag. `sudo docker commit <containerID> <newContainerName>:<tag>`
 - SSH into container using Docker CLI -> `sudo docker exec -it <containerID> /bin/bash` (use sh for shell access)
 - `docker logs -f <containerId>` -> Prints the container logs, '-f' will print the logs continously. 
 - `docker run -d -p 8080:80 --name my-webserver -e BACKEND_NAME=mybackend -e FRONEND_NAME=frontend nginx` -> -e refers to environment variable. This way we can pass environment variables inline.
 - `docker run -d -p 8080:80 --name my-webserver --env-file FILENAME nginx` -> --env-file variable is used to pass a key-value pair file as environment file.


 ## Creating Dockerfile
 
 - The docker file contains all the commands to run the docker image.
 - The docker file name should be strictly as "Dockerfile", it is case sensitive and no extension. If the file name is changed, you need to specify while building. (-f dockerFileName)
 - Create a Dockerfile and insert your commands inside, example: 
 'FROM nginx
 COPY index.html /usr/share/nginx/html'
 - Build the docker image `sudo docker build -t <imageName>:<tag> .`
 - Run the docker

# Notes
 - The docker comes with docker CLI, docker daemon (docker d), container d and run c
 - Docker CLI sends a REST request to docker d from command line
 - Docker Deamon is responsible for docker images
 - Container d is responsible for managing life-cycle of docker containers
 - run c is responsible only for creating a container and it dies.

# Docker Networks
 - Docker have 3 types of network by default. Bridge, Host and Null.
 - Every container created by default will join bridge network type and containers can communicate with each other using its IP address only. 
 - `docker network create wp-net` -> creates a new network with name wp-net and by default as Bridge network.
 - `docker run -d -p 8081:80 --network wp-net wordpress` -> runs container in the network.

# Docker Compose
- Tool to define and create multiple continer applications
- Docker compose is a yaml file (compose.yaml)
- `docker compose -f wp-compose.yaml up -d` -> Runs the docker containers from docker compose file
- Docker container data is not persistant until we attach a volume to the db container.
- `/var/lib/docker/volumes` -> location of the docker volumnes
