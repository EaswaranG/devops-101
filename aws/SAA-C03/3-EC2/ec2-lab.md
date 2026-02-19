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

**Step 1:** Navigate to EC2 Dashboard -> Select Volumes in the left pane under Elastic Block Store -> Select the root volume which is attached to the EC2 instance -> Actions -> Create Snapshot

![Volume Creation Dashboard](/aws/SAA-C03/assets/.labImages/ec2/volumesDashboard.png)

![Snapshot Creation Wizard](/aws/SAA-C03/assets/.labImages/ec2/snapshotCreation.png)

**Step 2:** In the create snapshot wizard, enter description and tags -> Click Create snapshot. This will create a snapshot of the EBS volume.

![Snapshot Creation Dashboard](/aws/SAA-C03/assets/.labImages/ec2/snapshotCreated.png)
*Note:* The snapshot will be created in the same AZ as the volume.

------------

###### Create a new volume from the snapshot

**Step 1:** Navigate to EC2 Dashboard -> Select Snapshots in the left pane under Elastic Block Store -> Select the snapshot -> Actions -> Create volume from snapshot

![Volume Creation Dashboard](/aws/SAA-C03/assets/.labImages/ec2/volumeCreationDashboard.png)

**Step 2:** Select rhe volume type, size, IOPS, Throughput, most importantly the volume must be in the same AZ as the EC2 instance you want this volume to be attached later. Click create volume.
*Note: You can optionally encrypt the volume using customer managed or amazon managed KMS Key.*

![Volume From Snapshot](/aws/SAA-C03/assets/.labImages/ec2/volumeFromSnapshot.png)

**Step 3:** Once the volume is created, it available to use. You have to attach the volume to a EC2 instance to use the newly created volume. EC2 -> Volumes -> select the available volume -> Actions -> Attach Volume. In the Attach volume wizard, select the EC2 instance from the list (in the same AZ) and select a device name in the list (you can not assign a random name). -> Click Attach Volume.

![Volume Attachment](/aws/SAA-C03/assets/.labImages/ec2/volumeAttachWizard.png)

**Step 4:** Navigate to EC2 instance and in storage tab look for the attached block devices and the device names. However, the newly attached device is available to use only after *mounting the volume*.

![Mount Volume](/aws/SAA-C03/assets/.labImages/ec2/mountAVolume.png)

*Note: To mount the volume you can use linux / windows mount commands, however remember to wipe the partition table, because this volume is created from a snapshot which the root volume was not empty and had partition tables.*

------------

###### Create an AMI using the snapshot

**Step 1:** Amazon Machine Image (AMI) can be created in two ways. 
    1) Creating Image from running EC2 Instance
    2) Creating Image from a snapshot
In this example we will be doing the snapshot method to create AMI.
Navigate to EC2 -> Snapshots -> Select a snapshot -> Actions -> Create Image from Snapshot.

![AMI Creation Dashboard](/aws/SAA-C03/assets/.labImages/ec2/AMICreationDashboard.png)

**Step 2:** In the AMI Creation Wizard, enter the name, description, select OS Architecture, root dir, Boot Mode and optioanlly EBS Volume. -> Create Image.

![AMI Creation Wizard](/aws/SAA-C03/assets/.labImages/ec2/AMICreationWizard.png)

**Step 3:** Once the AMI is created this will be available to use as a base image to create new EC2 Instance.

![AMI Creation Wizard](/aws/SAA-C03/assets/.labImages/ec2/AMICreated.png)

**Step 4:** Create a new EC2 Instance, in the launch wizard AMI section -> Select My AMIs tab -> Owned by me -> Notice your AMI will pop up here. Use this image to create an EC2 instance.

![EC2 Instance From AMI](/aws/SAA-C03/assets/.labImages/ec2/EC2UsingMyAMI.png)

**Step 5:** SSH in to the newly created EC2 instance and verify if working. 

![SSH into EC2 Instance](/aws/SAA-C03/assets/.labImages/ec2/SSHIntoEC2CreatedonAMI.png)

**Step 6:** Optionally deregister the AMI if not planning to use. 

![EC2 Instance From AMI](/aws/SAA-C03/assets/.labImages/ec2/deregisterAMI.png)

------------
