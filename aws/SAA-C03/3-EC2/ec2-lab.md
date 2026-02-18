## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS EC2 - Elastic Compute Cloud Practice

#### EC2 Instance, Snapshot, Volume, and AMI Creation

###### Create and launch an EC2 Instance
**Step 1:** Login to AWS Management Console and in the search box, navigate to EC2.
**Step 2:** In the EC2 Dashboard, select "Instances". Note down which *region* you are creating this resource, since EC2 is a *Region Specific Resource*
![EC2 Instance Dashboard](/aws/SAA-C03/assets/.labImages/ec2/ec2InstanceDashboard.png)
**Step 3:** In the launch wizard, fill in the details as indicated.
![EC2 Instance Launch Wizard](/aws/SAA-C03/assets/.labImages/ec2/ec2InstanceLaunchWizard.png)
**Note:** We will cover about AMI, Volume and Security Groups later in the course. As of now remember AMI as the Operating System's base image which could be Linux, Windows, MacOs, or flavours of linux such as RHEL, Amazon Linux, Ubuntu etc. For the purpose of this course, use a smaller EC2 Instance Type like t2.micro or t3.micro (based on availability in that region)

**Step 4:** Create a KeyPair to SSH into the machine remotely. To create a new KeyPair, select *"Create key pair" Option* -> *Enter a name* -> *Select the KeyGen Algorithm either RSA or ED25519* -> *Select the key type as .ppk if your local machine is Windows 10 and older version of Windows, if not all other OS supports .pem* -> *Download the key and store it in local securely*

**Step 5:** Create a network for this EC2 intance. Use a default VPC came with the AWS account for this course and a default subnet, however, we will learn VPC advance in the later modules of this course. 
*Note:* While Creating SG rules you would notice only inbound rules are created for SSH, HTTP and HTTPS, it is because SG is **stateful**, meaning, any connections established from a port out of this instance will be remembered and allowed the response back in the same port by default (only if outbound connection is made by the instance).

![EC2 Instance Launch Wizard](/aws/SAA-C03/assets/.labImages/ec2/ec2IntanceLaunchWizard2.png)

**Step 6:** Attach an EBS Volume (use gp3 for this course, an latest generation general purpose SSD), leave the advanced options if customization required like placement groups, AD joining, IAM, User Data for launch script etc. Launch the instance once all required configs are updated.

![EC2 Instance Created](/aws/SAA-C03/assets/.labImages/ec2/ec2InstanceCreated.png)

**Step 7:** SSH into EC2 Instance we created using EC2 Connect options, we will use local terminal and connect using SSH KeyPair we created.

![EC2 Instance SSH](/aws/SAA-C03/assets/.labImages/ec2/ec2InstanceSSH.png)

------------


###### Create a Snapshot of the Instance’s Root Volume