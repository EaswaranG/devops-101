# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS ELB - Elastic Load Balancer

##### What is scaling ?
- Increasing or decreasing the resource capacity on-demand and on-the-fly.
- There are two types of scaling
    - Horizontal Scaling (Increasing the number of nodes)
    - Vertical Scaling (Increasing the capacity of the existing node)

##### Notes:
- Vertical scaling requires a downtime to scale up or down.
- Horizontal Scaling is a complex structure, not all applications supports this (Eg: Lagacy application with tight dependency on monolithic instance).
- HS is a stateless Architecture (i.e It doesn't depend on other systems to work). Shared storage systems like S3 or EFS can handle data persistence.
- HS uses ELB to distribute incoming traffic among other instances. ELB ensures no single instance is overloaded and increased fault tolerance.

##### OSI Layer
- Application (End user layer -> HTTP, FTP, IRC, SSH, DNS)
- Presentation (Syntax Layer -> SSH, IMAP, JPEG)
- Session (Synch & Send to port -> APIs sockets, winSock)
- Transport (End-to-End Connections -> TCP, UDP)
- Network (Packets -> IP, ICMP, IGMP)
- Data Link (Frames -> Ethernet, PPP, Switch, Bridge)
- Physical (Physical Structure -> Coax, Fibre, Wireless, Repeaters)

##### Load Balancer
- AWS ELB automatically distributes incoming traffic across multiple servers/Instances to make sure no single server is overwhelmed.
- ELB has 
    - Application Load Balancer (Works at Layer 7 - Application Layer -> HTTP(s), websockets)
    - Network Load Balancer (4 - Transport Layer -> TCP, UDP)
    - Gateway Load Balancer (3 - Network Layer -> IP, ICMP)
    - Classic Load Balancer (Deprecated -> Layer 4/7)
- ELB `checks the health` of the instance before sending the traffic, ELB uses `sophisticated algorithms` like round robin, 5 tuple hashing,  least outstanding, weighted random etc.
- ELB requires to have `Target Groups`. Target can be Instance, IP Address, Lambda or another ALB.
- ALB can only `load balance between AZs` not across regions.
- Create an Instance First (Targets) -> Create Target Groups next -> Create an ELB of your requirement.
- ALB can also attach an ACM (Certificate) SNI with it.
- **Stickiness:** ALB Supports stickiness in `Load balancer cookie level` or `Application-based Cookie`.
- **Cross Zone Loadbalancing:** Optionally balances traffic evenly across instances in all AZs. If all AZs don't have equals instances, enabling crozz zone loadbalancing will make sure all instances throughout the region are balanced evenly despite the number of instances in each AZ.
- *NLB* - This is a ultra low latency load balance works on Layer 4.
- *Gateway LB* - Operates on Layer 3 (Network Layer) works as an single entry point load balancing (acts as an gateway to AWS cloud from other sources such as on-prem or another AWS cloud using Transit Gateway)
