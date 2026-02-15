# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS EC2 - Elastic Compute Cloud

##### What is EC2 ?
In AWS EC2 is a resizable virtual machine on AWS Cloud (IaaS).

##### Advantages of EC2?
- Resizable
- EBS Support - Block Storage for reliable storage solution (Other storage options also available such as EFS, Instant Store)
- Can integrate with multiple AWS Services like ELB
- Auto Scaling - Resizes the capacity based on demand
- Bootstrap Script (EC2 User Data) -> allows running script at first launch.


##### Instance Types:
- General Purpose (Balanced CPU, Mem and N/w)
- Compute Optimized (High CPU Performance)
- Memory Optimized (More RAM intensive)
- Storage Optimized (High IOPS and throughput)
- Accelerated Computing (AI/ML, video rendering)


##### Security Groups
- SG is a `stateful` resource, meaning the response calls doesn't require explicit allow in outbound rules.
- No explicit deny, only explicit Allow is available.
- `Stateless Firewall` -> NACL 
- `Satefull Firewall` -> Security Group
- Internet -> NACL -> Subnet -> Security Group -> EC2 Instance
- In NACL the outbound must be allowed, although SG response doesn't require implicit allow, NACL requires a explicit allow.
- SG is attached to an ENI (Elastic Network Interface Card)
- *Note:* Explicit allow for all sources in SG might be default, use it with caution for production workload.
- Example: A EC2 instance wants to connect to internet via a port, that should be added to NACL outbound, but SG outbound doesn't require.

##### Types of EC2 Instance Plans
- **EC2 On Demand**: Pay-as-you-go pricing (per second for Linux, per hour for Windows). Most expensive option for long-running instances.
- **Reserved Instances** (1 or 3 years): Pre-commit capacity for significant discounts (up to 75% with all-upfront payment). Trade-off: instance type is locked and cannot be changed.
- **Convertible Reserved Instances**: Like Reserved Instances but with flexibility to change instance types during the commitment period.
- **Savings Plans** (1 or 3 years): Flexible commitment across EC2, Fargate, and Lambda with discounts up to 60%. Instance type can be changed anytime—ideal for multi-compute workloads without lock-in.
- **Spot Instances**: Unused AWS capacity at up to 90% discount. Risk: instances can be interrupted when AWS reclaims capacity. Requires bidding and not suitable for critical workloads.
- **EC2 Dedicated Hosts**: Physical bare-metal servers exclusively for your account with kernel-level control. Supports bring-your-own-license (BYOL) scenarios.
- **EC2 Dedicated Instances**: EC2 instances running on dedicated hardware isolated from other customers. Suitable for strict compliance and security requirements.
- **EC2 Capacity Reservations**: Reserve compute capacity in a specific Availability Zone for any duration. Useful for organizations needing guaranteed capacity in particular regions.
- **Spot Fleet Requests**: Combines multiple Spot Instances and On-Demand instances for high availability and reliability with persistent storage.


##### EC2 - Advanced
- `Placement Groups` in EC2 instances close together within a single AZ for low-latency. This will reduce the latency by physically placing them near by. 
- `Types of Placement Group Strategy:` 
    - Cluster (Same Rack -> Single point of failure)
    - Spread(Different Rack, Next to next -> Adds Latency)
    - Partition (Specifies number of partitions segregated physically), this is combination of cluster and spread.
- `ENI` Elastic Network Interfaces -> This is a virtual network card for your EC2 instance to be in a network. We can add multiple ENI NICs in multiple subnets (in the same region and `same AZ`). If a EC2 instance is failing, we can create new EC2 instance and detach the ENI from failed instance and attach to new instance, this will retain the IP Address.
- EC2 instance can be `hibernated`. i.e The current state of the RAM is captured and stored in the Storage Disk, next time when the instance starts, the state will be loaded from Disk to RAM to resume. (Faster startup, saves cost, retains application state) (Not all instance types are hibernation support, RAM should be less than 150 GB)
- `EBS` - It is a network drive but attached as a normal hard disk and the data stores as block (stored in multiple hardware for HA). `EBS Volume is AZ Specific`. `Elastic Block Store` volume can be deleted on EC2 termination.
    - `IOPS` - How many Inputs and Outputs per second (Read and Write speed per second) -> *Eg:* 3000 IOPS
    - `Throughput` - Measures the size of file per second. -> *Eg:* 125 MiB/s (st1 is a throughput optimized HDD)
    - After EBS is created, EBS must be mounted to the EC2 instance if created separately.
    - To move EBS volume between AZ or Region, take a `snapshot` and copy to another region, then create a new volume in other AZ using this snapshot. If encryped using a keypair, the key will change, same key can not be used in another AZ.
- `Snapshot Usage`: 
    - Automated Snapshots, Incremental Snapshots, Cross-Region copy, Snapshot Encryption, Restore Options, `Create your custom AMIs`, Fast Snashot Restore.
- `Provisioned IOPS SSD (io2)` is a Enterprise Grade EBS Volume which is the **only type that can be multi-attach up to 16 EC2 instance**.
- `EC2 Lifecycle Manager policy` can be created to created automated scheduled snapshots.
- `AMI` - Amazon Machine Image (The OS Image): Take a snapshot first then in `Actions` you can find `Create Image from Snapshot`.
- `Ephemeral EC2 Instance Store`: Temporary high speed storage directly attached to the physical instance, but destroyed while EC2 instance stops. Non-Persistent data store with a high performance and low-cost.

##### Notes
- Use `Instance Type Finder` tool in EC2 to find which instance type to use for your workload.
- AMI (`Amazon Machine Image`) - It is like a ISO image, which type of OS you want to install.
- `Key Pair` can be generated using `RSA` or `ED25519` type to connect to an EC2 instance using SSH. Download the private key and use that to SSH into EC2.
- While creating a EC2 instance you can optionally enter `User Data` which will run some BASH commands only on the first launch (not every restart). This will be handy to install pre-req packages.
- Create or select a `Security Group` and attach to the EC2. The Security Group `Inbound and Outbound Rules` decides what port can accept request and send traffic out.
- Open port `22` to SSH into the EC2.
- While generating KeyPairs, the public key will be attached to the EC2 instance and a private key will be downloaded (only once) to your local. Use the private key to SSH into the EC2 instance.
- Private IP CIDR Range 
    - *Class A* (10.0.0.0/8) 10.0.0.0 to 10.255.255.255 -> Used on bigger N/w
    - *Class B* (172.16.0.0/12) 172.16.0.0 to 172.31.255.255 -> Used in Medium scale N/w (AWS Default VPC is Class B)
    - *Class C* (192.168.0.0/16) 192.168.0.0 to 192.168.255.255 -> Used in a small N/w
- Public IP CIDR Range
    - *Class A* 0.0.0.0 to 126.255.255.255
    - *Class B* 128.0.0.0 to 191.255.255.255
    - *Class C* 192.0.0.0 to 223.255.255.255
    - *Class D* 224.0.0.0 to 239.255.255.255
    - *Class E* 240.0.0.0 to. 254.255.255.255 
- Public IP in EC2 will change every restart, to have a permanent IP, purchase an `Elastic IP Address` and associate it with the EC2 instance.

