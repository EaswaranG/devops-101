## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Autthor Easwaran Govindarajan

## AWS App Runner

AWS App Runner is a fully managed service that makes it easy for developers to deploy from source code or container image directly to a scalable and secure web application.

--------

###### Create an AppRunner service with a Nginx container, source as an AWS Public ECR and deploy the service in AppRunner

**Pre-Req:** We need an ECR repo, in this example we will use a public AWS ECR repo `public.ecr.aws/nginx/nginx:stable-perl` 

**Step 1:** Navigate to `AWS Console` -> search for `App Runner` -> select `Create an App Runner service`. Note: This service may not be available in all regions.

![App Runner](/aws/SAA-C03/assets/.labImages/AppRunner/AppRunner.png)

**Step 2:** In the launch wizard choose the container registry as Public ECR. If you require any custom image, push it to ECR private repo and use it in  private ECR provider.

![App Runner 2](/aws/SAA-C03/assets/.labImages/AppRunner/AppRunner2.png)

**Step 3:** Configure the service by selecting the instance size, auto-scaling, health checks, security using instance role, KMS, Networking and monitoring.

![App Runner 3](/aws/SAA-C03/assets/.labImages/AppRunner/AppRunner3.png)

NOTE: `Enable Public access in the networking for this lab for our service to send outgoing messages. Review and create the service.`

**Step 4:** Once the service is selected, this will start the deployment of the service and host in a default domain. Give it couple of minutes to start.

![App Runner 4](/aws/SAA-C03/assets/.labImages/AppRunner/AppRunner4.png)

NOTE: `Our build failed because of the service endpoint and  health check configured in TCP port (8080), however the NGIX port is HTTP:80, edit the configuration and rebuild to fix.`

**Step 5:** Open the URL in a browser window to validate if the nginx container is running. 

![App Runner 5](/aws/SAA-C03/assets/.labImages/AppRunner/AppRunner5.png)

NOTE: `You can link this to your Amazon Route 53 or Non-Amazon domain`

**This is the end of AppRunner lab. Clean up the resource after use to avoid incurring cost**

![App Runner 6](/aws/SAA-C03/assets/.labImages/AppRunner/AppRunner6.png)


----------