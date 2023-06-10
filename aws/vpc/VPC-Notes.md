# VPC - Virtual Private Network

- Take Bigger subnet, as the company grows, you need more IP's.
- Seperates Public and Private Subnets.
- Keep internal only components in Private subnet.
- Use NAT Gateway in Public Subnet to access Internet by the components in private subnet.
- Example: Backend code, DB is kept in private subnet. For example, the maven wants to download dependencies from internet, use NAT Gateway.
- When a component in public subnet wants to connect to component in private subnet, using routing table they can communicate with private subnet components.
- If a component in public subnet wants to connect to internet, it uses IGW (Internet Gateway) to connect to internet.
- AWS S3 will have S3 end point in the routing table.
- If a component in private subnet wants to connect to S3, the request will leave the subnet via NAT Gateway, finds the S3 end points and routes the HTTP Request.
- Every request goes out from NAT Gateway, it costs. The data coming in is free.
- Define S3 endpoint in the routing table, so that the request won't go out of the Gateway and we can save cost.
- NAT will cost per every hour and also for every request going out of the subnet.

## Creating a VPC
- Login to AWS -> VPC -> New VPC -> Configure your VPC based on your requirement.
- When we create a VPC, a subnet, routing table, IGW are created.
- If we create NAT, it will create a VM and it takes time and also incurs cost.

- Public IP Address is free unless we use it. You will be charged if you don't use the IP.
<img width="1203" alt="image" src="https://github.com/EaswaranG/devops-101/assets/75293695/f918f938-ee54-4b7d-80ff-fc6787b33dd6">
