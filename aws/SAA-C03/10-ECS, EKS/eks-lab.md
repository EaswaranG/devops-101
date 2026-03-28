## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Autthor Easwaran Govindarajan

## AWS EKS (Elastic Kubernetes Service)

Amazon EKS is a managed service that makes it easy for you to use Kubernetes on AWS without needing to install and operate your own Kubernetes infrastructure.

--------

###### Create an EKS Cluster

**Step 1:** Navigate to `AWS Console` -> search for `EKS` -> select `Elastic Kubernetes Service` -> In the left pane, select `Clusters` -> click `Create Cluster`.

![EKS Cluster](/aws/SAA-C03/assets/.labImages/EKS/EKSCluster.png)

Create the recommended role for your EKS.

![EKS Role](/aws/SAA-C03/assets/.labImages/EKS/EKSRole.png)

Click create and wait some time for the cluster to be created. The compute of the worker nodes will be auto selected since the EKS is configured in Auto Compute mode. In our example, two `EC2 c6g.large instance` created.

![EKS Cluster 2](/aws/SAA-C03/assets/.labImages/EKS/EKSCluster2.png)

--------
###### Create a Managed Node Group Using the Console

**Step 1:** Navigate to the `Cluster` -> select `Compute` Tab -> under `Node Group` we need to create a new node group for the worker nodes to autoscale.

![EKS Node Group](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup.png)

Create a new Node group from the launch wizard.
![EKS Node Group 2](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup2.png)

**Step 2:** Configure the compute of the node to use on-demand or a Spot instance. Select instance type, AMI and desired number of nodes.

![EKS Node Group 3](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup3.png)

**Step 3:** Configure the network and review the configuration and create the node group.

![EKS Node Group 4](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup4.png)

**Step 4:** Verify Your Worker Nodes Are Registered by navigating to `compute` tab and see the registered nodes. You should see one or more nodes with a status of Ready. These nodes are now available to run your Kubernetes workloads.

**NOTE:** Our node group has stuck in create mode for longer time, the EC2 instance is running, nodes are registered, but can not initialize.

![EKS Node Group 5](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup5.png)

1. Fix Kubeconfig:

``` bash
aws eks update-kubeconfig --region ca-central-1 --name eks-cac1-cluster-primary
```

2. Then run the below to see the kube config
``` bash
kubectl get pods -n kube-system
```

![EKS Node Group 6](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup6.png)

**Step-by-step FIX**
Step 1: Check EKS Addons, navigate to `EKS Console` → `Cluster` → `Add-ons`
Step 2: Install missing addons

Adds CNI Add-on
``` bash
aws eks create-addon \
  --cluster-name eks-cac1-cluster-primary \
  --addon-name vpc-cni \
  --region ca-central-1
```
Adds Kube-proxy Add-on

``` bash
aws eks create-addon \
  --cluster-name eks-cac1-cluster-primary \
  --addon-name kube-proxy \
  --region ca-central-1
```
Adds core-dns Add-on

```bash
aws eks create-addon \
  --cluster-name eks-cac1-cluster-primary \
  --addon-name coredns \
  --region ca-central-1
```

![EKS Node Group 7](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup7.png)

![EKS Node Group 8](/aws/SAA-C03/assets/.labImages/EKS/EKSNodeGroup8.png)

--------
###### Deploy a sample application

**Step 1:** Deploy a sample nginx server in the EKS to see if the deployment is working as expected.

**Step 1:** Create a sample deployment

We’ll use a lightweight NGINX app:

``` bash
kubectl create deployment nginx-demo --image=nginx
```
Verify pod is running, you should see nginx-demo-xxxxx as Running.

```bash
kubectl get pods
```

Expose it as a service (LoadBalancer)
```bash
kubectl expose deployment nginx-demo \
  --type=LoadBalancer \
  --port=80
```

Get external URL using below command, look for EXTERNAL-IP for the nginx-demo we created, there will be a DNS name, we can hit this in a browser window to see.

```bash
kubectl get svc
```

![EKS Deploy](/aws/SAA-C03/assets/.labImages/EKS/EKSDeploy.png)

**If your EXTERNAL-IP is `stuck in pending` status, this is a very common EKS networking gap, this is more likely `subnets are not tagged correctly` or `cluster doesn't know which subnets to use`**

Find your VPC and subnets and note them, you need to `tag` these subnets for load balancer.

![EKS Deployment Failure](/aws/SAA-C03/assets/.labImages/EKS/EKSDeployment.png)

```bash
aws eks describe-cluster \
  --name eks-cac1-cluster-primary \
  --region ca-central-1 \
  --query "cluster.resourcesVpcConfig.subnetIds"
```
Enter the subnets one by one in the below command to tag them. Create an `ELB Tag` and `Cluster Ownership` tags.

```bash
aws ec2 create-tags \
  --resources <subnet-id> \
  --tags Key=kubernetes.io/role/elb,Value=1
```
Use internal-elb if this is private subnet, which will create internal LB instead of internet-facing.
You can verify the LB schema type directly in the EC2 -> Load balancer.

![Load Balancer](/aws/SAA-C03/assets/.labImages/EKS/EKSLoadBalancer.png)

```bash
aws ec2 create-tags \
  --resources <subnet-id> \
  --tags Key=kubernetes.io/cluster/eks-cac1-cluster-primary,Value=shared
```

![EKS Subnet](/aws/SAA-C03/assets/.labImages/EKS/EKSSubnet.png)


**Recreate service (IMPORTANT)**
``` bash
kubectl delete svc nginx-demo
```
We can either use CLI or use a service.yaml json file and pass the command.
``` bash
kubectl expose deployment nginx-demo \
  --type=LoadBalancer \
  --port=80
```
Once the deployment is completed, get the External URL and hit that in a browser window.

![EKS Nginx Deployed](/aws/SAA-C03/assets/.labImages/EKS/EKSNginx.png)


This is the end of EKS Lab, clean up the resources to stop incurring cost.
-------