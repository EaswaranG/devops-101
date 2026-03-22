## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Autthor Easwaran Govindarajan

## AWS ECS - Elastic Container Service


###### Create an ECS Cluster using Fargate (Serverless) launch type or EC2 Launch Type

**Step 1:** Navigate to `AWS Console` -> search for `ECS` -> select `Clusters` from the left panel

![ECS Creation](/aws/SAA-C03/assets/.labImages/ECS/ECSCreation.png)

**Step 2:** Create a new `ECS Cluster` with `EC2 Launch Type` for this demo, we can choose `on-demand provisioning` with `1 Desired Task`.

![ECS Creation 2](/aws/SAA-C03/assets/.labImages/ECS/ECSCreation2.png)

Choose the Network Settings, on which VPC and subnet you want to place this EC2 instance and select the security group for the same.

![ECS Creation 3](/aws/SAA-C03/assets/.labImages/ECS/ECSCreation3.png)

Choose `Monitoring` settings for the `Container Insights`, this will help us troubleshoot any issues in our container. Also choose a `KMS Key` to Encrypt data in transit and encyption at rest. Once configured, click `create`.

![ECS Creation 4](/aws/SAA-C03/assets/.labImages/ECS/ECSCreation4.png)

Open the cluster to see more information.

![ECS Creation 5](/aws/SAA-C03/assets/.labImages/ECS/ECSCreation5.png)

--------

###### Create an ECS Task Definition

**Step 1:** Navigate to `AWS Console` -> search for `ECS` -> select `Task definitions` from the left panel -> `Create new Task Definition`

![Task Definition Creation](/aws/SAA-C03/assets/.labImages/ECS/TaskDefinition.png)

**Step 2:** Use this wizard to give specific instructions for the task, what are the containers this task has to run, and what are its image, port mapping, logging controls, networking etc.

![Task Definition Creation 2](/aws/SAA-C03/assets/.labImages/ECS/TaskDefinition2.png)

This will create a JSON Task definition file, we will use this file to create tasks and that task will create containers and manage them.

![Task Definition Creation 3](/aws/SAA-C03/assets/.labImages/ECS/TaskDefinition3.png)

--------

###### Create an ECS Service using the Task Definition which we created in above step

**Step 1:** Navigate to `AWS Console` -> search for `ECS` -> select `Clusters` from the left panel -> Select the cluster we created before -> Select `Services` Tab and click `Create Service`.

![Service Creation](/aws/SAA-C03/assets/.labImages/ECS/ServiceCreation.png)

**Step 2:** Create `2 desired tasks` and the `Deployment Options` as `Rolling Update` where min running tasks is `00% and Max is 200% if scaled up.

![Service Creation 2](/aws/SAA-C03/assets/.labImages/ECS/ServiceCreation2.png)

![Service Creation 3](/aws/SAA-C03/assets/.labImages/ECS/ServiceCreation3.png)

![Service Creation 4](/aws/SAA-C03/assets/.labImages/ECS/ServiceCreation4.png)

**Step 3:** Validate the Nginx container by hitting its public IP address in a browser.

![Validate Nginx](/aws/SAA-C03/assets/.labImages/ECS/ValidateNginx.png)

--------

###### Run a standalone ECS Task

**Step 1:** In addition to the service, you can run a standalone task that doesn’t require management by ECS service. Navigate to `ECS Cluster` -> Select `Tasks` Tab -> `Run new Task`

![Standalone Task](/aws/SAA-C03/assets/.labImages/ECS/StandaloneTask.png)

Select the task definition, Network with public IP, Volume and other additional settings.

![Standalone Task 2](/aws/SAA-C03/assets/.labImages/ECS/StandaloneTask2.png)

![Standalone Task 3](/aws/SAA-C03/assets/.labImages/ECS/StandaloneTask3.png)

**Step 2:** Validate the standalone task by opening the public IP of that task in the browser.

![Standalone Task 4](/aws/SAA-C03/assets/.labImages/ECS/StandaloneTask4.png)

This is the end of ECS Lab, there are many more features ECS offers, we manage the task definition file per environment in the git repository along with the code base to automate in the CICD pipeline.

Clean Up the resources to stop incurring cost once lab is completed.
![Cleanup ECS](/aws/SAA-C03/assets/.labImages/ECS/CleanUpECS.png)

--------
