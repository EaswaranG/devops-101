## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS ALB

###### Configure an AWS ALB using HTTP in Target Group 

**Step 1:** Login to AWS Management Console and in the search box, navigate to EC2 -> Under load balancing section -> Select Load Balancers -> Create Load Balancer.

![LB Creation Wizard](/aws/SAA-C03/assets/.labImages/ALB/LBCreationWizard.png)

**Step 2:** Choose Application Load Balancer for HTTP(s), websockets traffic (Works on OSI Layer-7 Application Layer)
- Application Load Balancer (Works at Layer 7 - Application Layer -> HTTP(s), websockets)
- Network Load Balancer (4 - Transport Layer -> TCP, UDP)
- Gateway Load Balancer (3 - Network Layer -> IP, ICMP)
- Classic Load Balancer (Deprecated -> Layer 4/7)

![LB Types](/aws/SAA-C03/assets/.labImages/ALB/LBTypes.png)

**Step 3:** In the launch wizard, select Internet-facing loadbalancer since we are going to host an EC2 instance which is in public subnet and running an web application. That EC2 instance must be enabled with public IP address and security group inbound rule must allow HTTP/Https traffic.

![LB Launch Wizard](/aws/SAA-C03/assets/.labImages/ALB/LBLaunchWizard.png)

**Step 4:** In the launch wizard, select or create an security group by allowing HTTP:80 or HTTPs:443 ports in the inbound rule. For the lab sake we will disable Target Group Stickiness. Additionally and Listener can be added. ALB supports HTTP and HTTPs listeners.

![LB Launch Wizard-2](/aws/SAA-C03/assets/.labImages/ALB/LBLaunchWizard2.png)

Note: If HTTP(s) listener is selected, an default SSL/TLS server cert is mandatory.
![LB Launch Wizard-3](/aws/SAA-C03/assets/.labImages/ALB/LBLaunchWizard3.png)

NOTE: You can not create an ALB without Target Group and Targets, in the next step we will create TG and finish ALB setup.

---------

###### Create Target Group and Targets

**Step 1:** Login to AWS Management Console and in the search box, navigate to EC2 -> Under load balancing section -> Select Target Groups -> Create Target Groups. (Assuming two EC2 instances (Targets) are already running).
Configure the health check (defaulted to root /) endpoints. Some applications uses swagger endpoints like /health-check.

![TG Launch Wizard-1](/aws/SAA-C03/assets/.labImages/ALB/TGLaunchWizard.png)

**Step 2:** Click next to register targets, these are running EC2 instance in the same VPC and with public IP addresses. Since we are using internet-facing ALB, the EC2 instance must be in public subnet.

![TG Launch Wizard-2](/aws/SAA-C03/assets/.labImages/ALB/TGLaunchWizard2.png)

**Step 3:** Click next to review the TG details and click Create Target Group

![TG Launch Wizard-3](/aws/SAA-C03/assets/.labImages/ALB/TGLaunchWizard3.png)

**Step 4:** The Target group is created but this is not being used until attached to an ALB.

![TG Launch Wizard-4](/aws/SAA-C03/assets/.labImages/ALB/TGLaunchWizard4.png)

**Step 5:** Navigate back to the ALB Launch wizard and click refresh button next to Target Group drop down to refresh the list. The new TG must be showing in the dropdown by now.

![LB Target Group Added](/aws/SAA-C03/assets/.labImages/ALB/LBTargetGroupAdded.png)

**Step 6:** Once an ALB is created, review the listeners and rules. We can edit the rules and listeners anytime after creation.

![LB Target Group Added](/aws/SAA-C03/assets/.labImages/ALB/LBResourceMap.png)

**Step 7:** Copy paste the DNS name directly to the browser search.

![LB Test 1](/aws/SAA-C03/assets/.labImages/ALB/LBTest1.png)

**Step 8:** Click refresh to see the traffic is round robin between node-1 and node-2.

![LB Test 2](/aws/SAA-C03/assets/.labImages/ALB/LBTest2.png)

ALB is now load balancing the traffic between the two instances, but in enterprise level, the listeners and rules will be bit more complex but the basic is the same.

--------