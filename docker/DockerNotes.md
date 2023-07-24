# Getting started with docker
## Author Easwaran Govindarajan

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
 - To build the docker image, executre `docker build -t appName:tagName .` Example: `docker build -t hello-python-app:latest .`
 - To create a tag to the docker image, executre `docker tag appName userName/folderName:tagName` Example: `docker tag hello-python-app easwarang/hello-python:latest`
 - To run the docker image, execute `docker run appName` Example: `docker run hello-python-app`
 - To login to the docker hub `docker login`
 - To push the docker image to hub, execute `docker push username/folderName:tagname` Example: `docker push easwarang/hello-python:latest`
 - To pull the docker image to hub, execute `docker pull uesrname/appName:tagname` Example: `docker pull easwarang/hello-python:latest`
 - `docker ps` -> lists running docker processes
 - `docker ps -a` -> lists all containers in any state
 - `docker container ls` -> returns running container (add -a to list in all state)
 - `docker rmi -f nginx` -> Removes an image from local
 - `docker run -d <imageName>` -> Runs the container in detached mode (background)
 - `docker stop <containerId>` -> Stops a running container
 - To do port forwarding to the container, we need to bind the VM port with the container port (eg: when i hit ip:8080, the request should be redirected to the port 80 of the container) `docker run -d -p 8080:80 <imageName>` -> Binds port 8080 of the local machine (or VM) with the port 80 of the docker image.
 - To copy a file inside a container, `sudo docker cp <file name> <container ID>:<path>` 
  Example: `sudo docker cp index.html 152bf0e4eede:/usr/share/nginx/html/`
 - Create a docker image from a running container, create a new image with tag. `sudo docker commit <containerID> <newContainerName>:<tag>`
 - SSH into container using Docker CLI -> `sudo docker exec -it <containerID> /bin/bash` (use sh for shell access)


 ## Creating Dockerfile
 
 - The docker file contains all the commands to run the docker image.
 - The docker file name should be strictly as "Dockerfile", it is case sensitive and no extension. If the file name is changed, you need to specify while building. (-f dockerFileName)
 - Create a Dockerfile and insert your commands inside, example: 
 'FROM nginx
 COPY index.html /usr/share/nginx/html'
 - Build the docker image `sudo docker build -t <imageName>:<tag> .`
 - Run the docker
