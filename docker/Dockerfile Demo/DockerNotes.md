# Getting started with Dockerfile
## Author Easwaran Govindarajan

In this example, I am creating a simple docker image from Docker Image

## Dockerfile commands

- FROM command is to mention the articatory/ImageName
- RUN command is to run some sh/bash commands
- EXPOSE command is to expose the port number of the container to host
- CMD is the executable command to the container

## Dockerfile notes
- A custom image can be created using Dockerfile.
- Build the docker image `sudo docker build -t <imageName>:<tag> .`
