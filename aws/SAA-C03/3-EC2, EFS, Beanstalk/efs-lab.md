## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS EFS - Elastic File System
Amazon Elastic File System (Amazon EFS) provides a simple, scalable, elastic file system for general purpose workloads for use with AWS Cloud services and on-premises resources.

###### Create EFS volume
**Step 1:** Login to AWS Management Console and in the search box, navigate to EFS.

![EFS Creation Dashboard](/aws/SAA-C03/assets/.labImages/ec2/EFSCreationWizard.png)

**Step 2:** Click Create EFS to launch create wizard, the default settings can be overridden by clicking customize option.

![EFS Creation Dashboard Advanced](/aws/SAA-C03/assets/.labImages/ec2/EFSCreationAdvancedWizard.png)

**Step 3:** In the Network step, choose the VPC and security group as same as the EC2 instance running.

![EFS Creation Dashboard Advanced-2](/aws/SAA-C03/assets/.labImages/ec2/EFSCreationAdvancedWizard2.png)

![EFS Creation Dashboard Advanced-3](/aws/SAA-C03/assets/.labImages/ec2/EFSCreationAdvancedWizard3.png)

**Step 4:** Review and create the EFS volume. Navigate to security group and open the NFS port 2049. Configure the source as security group.

![EFS Security group update](/aws/SAA-C03/assets/.labImages/ec2/EFSSecurityGroup.png)

----------

###### Mount EFS volume to EC2 

**Step 1:** SSH into EC2 instance. Navigate to EC2 Instance -> Connect -> EC2 Instance connect (or) use private key to SSH from local terminal.

**Step 2:** Install EFS Utils, use the package manager to install amazon-efs-utils.

![EFS Mounting](/aws/SAA-C03/assets/.labImages/ec2/EFSMounting.png)

**Step 3:** Since we have enabled encryption in transit, additional configs required. To fix the issue temporarily we can delete the policy and retry mounting.

![EFS Mounting](/aws/SAA-C03/assets/.labImages/ec2/EFSPermanentMounting.png)

**Step 4:** We can mount/attach the EFS on a linux instance by two ways.
- Mount via DNS
    - Using the EFS mount helper: 
        - sudo mount -t efs -o tls <EfsID>:/ /mnt/efs
    - Using the NFS client:
        -  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport <EfsID>.efs.ca-central-1.amazonaws.com:/ efs

- Mount via IP
    - Using the NFS client:
        - sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport <AZ_IP>>:/ efs
        - sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport [$MOUNT_TARGET_IPv6]:/ efs

![EFS Mounted](/aws/SAA-C03/assets/.labImages/ec2/EFSMounted.png)

----------