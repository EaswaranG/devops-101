# Getting started with Kubernetes
## Author Easwaran Govindarajan

 ## Container Orchestration Intro
 
 - Kubernetes is a container orchestration tool.

 Benefits:
 - Efficient Orchestration tool for large-scale applications.
 - Auto Healing: When a container is down, the orchestrator can start the container again.
 - Auto Scaling: Containers can be scaled.

 - Ex: RedHat Openshift is a Linux container orchestrator
 - Docker has Docker Engine's Swarm mode.
 - Kubernetes (K8s) was created by Google and declared as open-source in 2014.
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
    - etcd database - All config management is stored in this.
    - API Server - talks with other nodes
    - schedular - does bin packing. via API server, connects to kulect, and looks for mem to allocate the job and maintains the state.
    - controller - controls replicas
    - 
 - Worker Node:
    - Kublect - An agent that creates a container in the worker node.
    - Container - The running instance of a docker image.
 - Install Kubectl in the customer machine and use the CLI to connect to the master node.

## K8s Key components

![Azure K8](https://github.com/EaswaranG/devops-101/assets/75293695/47a38557-a825-46e8-b97f-5b8d76521076)

- Cluster
- Node
- Pods: Logical group of containers, the smallest unit of compute.
- Container
- An application will be packed as a Docker image, and the DockerEngine (dockerd) will run the Docker image as Docker Container. In K8s, the Container runs inside a pod, one or more pods are grouped inside a node, and one or more nodes are grouped as a cluster.

## Kubernetes Resources
>[!TIP]
>The Kubernetes Manifest file is used to specify the Kubernetes object state. This is usually a deployment.yaml and service.yaml file.

![k8s-resources](https://github.com/EaswaranG/devops-101/assets/75293695/fa6f974d-5bf7-4da6-859b-d2424f8f8a5c)

## Example Manifest File

- Deployment.yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: employeemgtbe
  namespace: employee-mgt-ns
spec:
  replicas: 1
  selector:
    matchLabels:
      app: employeemgtbe
  template:
    metadata:
      labels:
        app: employeemgtbe
    spec:
      containers:
        - name: employeemgtbe-container
          image: employeemgtbe.azurecr.io/employeemgtbe:v1
          ports:
            - containerPort: 8080
```
- service.yaml
```
apiVersion: v1
kind: Service
metadata:
  name: employeemgtbe
  namespace: employee-mgt-ns
spec:
  selector:
    app: employeemgtbe
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
  type: LoadBalancer
```
>[!NOTE]
>We can specify deployment and service manifest in a single file by separating them by three hyphens.
