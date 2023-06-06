# Getting started with docker
## Author Easwaran Govindarajan

In this example, I am creating a simple docker image and publishing to my docker hub and we will pull the image to a AWS EC2 instance and run the container.

My Docker base image was created in ARM architecture, so make sure to use appropriate VM.

## Docker 

Docker Hub is a container image repository, we could publish our images to the docker hub.
URL : https://hub.docker.com/
My Image : https://hub.docker.com/repository/docker/easwarang/hello-python/general

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
 - To build the docker image, executre `docker build`
 - To create a tag to the docker image, executre `docker tag`
 - To run the docker image, execute `docker run`
 - To push the docker image to hub, execute `docker push username/appName:tagname`
 - To pull the docker image to hub, execute `docker pull uesrname/appName:tagname`