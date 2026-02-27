## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Auto Scaling Groups

###### Create an AWS ASG with Launch Templates

**Step 1:** Login to AWS Management Console and in the search box, navigate to EC2 -> Under Instances section -> Select Launch Templates -> Create Launch Template.

![ASG Creation Wizard](/aws/SAA-C03/assets/.labImages/ASG/ASGCreationWizard.png)

**Step 2:** Give a name to your launch template and fill in the launch wizard just like how we did to create an EC2 instance in previous lab. Add a user data optionally, below is a small script to open a webpage. Click Create Launch Template once done.

```bash
#!/bin/bash
yum install -y httpd
systemctl start httpd
systemctl enable httpd

HOSTNAME=$(hostname)

echo "<html><h1>Hostname: $HOSTNAME</h1></html>" > /var/www/html/index.html
```

![ASG Launch Wizard](/aws/SAA-C03/assets/.labImages/ASG/ASGLaunchWizard.png)

**Step 3:** Now lets create an Auto Scaling Group (ASG). Navigate to EC2 -> Under Auto Scaling Groups -> Click Create Auto Scaling group -> Enter a name for the ASG and select the launch template.

![ASG Launch Wizard-2](/aws/SAA-C03/assets/.labImages/ASG/ASGLaunchWizard2.png)

**Step 4:** Select the Instance Launch option in the next step, select the VPC and AZs you want the ASG to balance the load -> Click Next

![ASG Launch Wizard-3](/aws/SAA-C03/assets/.labImages/ASG/ASGLaunchWizard3.png)

**Step 5:** Select the Integration with other services optionally, which can attach to a Load Balancer, VPC Lattice, ARC Zonal Shift, Health check configs etc (this is an optional step) -> Click Next

**Step 6:** In the next step, configure the group size and scaling policy. Refer to the image below.

![ASG Launch Wizard-4](/aws/SAA-C03/assets/.labImages/ASG/ASGLaunchWizard4.png)
![ASG Launch Wizard-5](/aws/SAA-C03/assets/.labImages/ASG/ASGLaunchWizard5.png)

**Step 7:** In the next step, optionally configure SNS topic to get notification when Auto Scaling launches or terminates the instance. -> Click next -> Review and create the ASG.

![ASG Launch Wizard-6](/aws/SAA-C03/assets/.labImages/ASG/ASGLaunchWizard6.png)

**Step 8:** Verify the ASG will launch 1 instances using launch template because of minimum capacity is 1 and this will scale up to two instances if ASG condition meets.

![ASG Launch Wizard-7](/aws/SAA-C03/assets/.labImages/ASG/ASGLaunchWizard7.png)

![Verify EC2](/aws/SAA-C03/assets/.labImages/ASG/verifyEC2.png)

ASG is now created and actively scaling the instances based on the policy we have defined. If the instance is crashed or someone stopped the instance accidentally, ASG will scale up immediately.

![Relaunch EC2](/aws/SAA-C03/assets/.labImages/ASG/relaunchEC2.png)


--------