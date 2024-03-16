# Getting started with Kubernetes
## Author Easwaran Govindarajan

 ## Container Orchestration Intro
 
 - Kubernetes is an container orchestartion tool.

 Benefits:
 - Efficient Orchestration tool for large scale application.
 - Auto Healing: When a container is down, the orchestartor can start the container again.
 - Auto Scaling: Containers can be scaled.

 - Ex: RedHat Openshift is an Linux container orchestrator
 - Docker has Docker Engine's Swarm mode.
 - Kubernetes (K8s) is created by google and declared as open-source in 2014.
 - We need K8s to manage our container.
 - K8s provides below features
        - Service Discovery, 
        - Load balancing, 
        - Storage Orchestration, 
        - Automated rollouts and rollbacks, 
        - automatic bin packing (allocating jobs to servers)
        - self-healing, 
        - secrets and configuration management.
 - Master Node:
    - etcd database - All config management are stored in this.
    - API Server - talks with other nodes
    - schedular - does bin packing. via API server, connects to kulect and looks for mem to allocate the job and maintains the state.
    - controller - controlls replicas
    - 
 - Worker Node:
    - Kublect - An agents, Creates container in the worker node.
    - Container - The running instance of an docker image.
 - Install Kubectl in customer machine and use the CLI to connect to the master node.

## K8s Key components

![Azure K8](https://github.com/EaswaranG/devops-101/assets/75293695/47a38557-a825-46e8-b97f-5b8d76521076)

- Cluster
- Node
- Pods: Logical group of containers, a smallest unit of compute.
- Container
- An application will be packed as Docker image, and the DockerEngine (dockerd) will run the docker image as Docker Container. In K8s, the Container is running inside a pod, one to more pods are grouped inside a node and one or more nodes are grouped as a cluster.
