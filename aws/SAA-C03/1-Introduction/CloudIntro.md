# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## Certification Intro
Duration - 130 mins
Format - 65 Multiple Choice or Multiple Response Questions
Cost - ~150 USD

## What is Cloud?
It is a computing resources on-demand delivery such as computing power, storage, network, apps etc over the internet with pay-as-you-go pricing.

## Who is Cloud Engineer ?
A Engineer who ensures the continutity of cloud resources, who is a professional who designs, builds and maintains the virtual infra and services that run on the internet.

## Exam Domains and Weightages
 - Design Secure Architectures 30% of scored content
 - Design Resilient Architectures - 26% of scored content
 - Design High-Performing Architectures - 24% of scored content
 - Design Cost-Optimized Architectures - 20% of scored content

## Types of Clouds
- Public
- Private (Difference between on-prem and private is - Private Cloud Hardware failures are resilient due to virtualization in cloud)
- Hybrid 
(Read More: https://www.redhat.com/en/topics/cloud-computing/cloud-vs-virtualization)

## AWS Global vs Regional Service
- AWS Global services are available worldwide and not tied to a region. (Eg: IAM, Route 53, CDN, WAF)
- AWS Global Infra is divided as Region, AZ and Regional Edge Cache.

- `Region:` Geographical grouping of Data Centers in a geographical region. (Eg: Canada-Central-1 and Canada-West-1 are two regions in Canada)
- `Availability Zone:` AZs are standalone Data Center which has dedicated power and network which is isolated from other data center. These DCs are fault-isolated but 
interconnected with low-latency links. Each DC is placed atleast ~50 to 60kms apart multiple data-centers has segregated in power and network for resiliency within the region. (eg: canada-central-1a)
- `Edge Network:` Edge is a small data center closer to customers requesting far away from server, edge caches the data. From Edge locations, the request travels through AWS private network to reduce latency and reduces origin server load by caching the data in edge. Point of Presence (POP) is combination of Edge server and Regional locations.
- `How Edge works?` - User Requests a content -> CDN checks for cached data -> In case of Cache hit -> It serves the content from cache -> If Cache miss, CDN Fetches from origin and caches it.
- `PointOfPresence (POP):` Combination of Edge location and Regional Edge Cache. This is used to cache static content closer to the user. (Eg: CloudFront, Route53, WAF)
- `How POP works?` - When a user needs a data from Origin Server located far away, and if there is cache miss in CDN, instead of sending traffic over internet, the regional edge locations gets the data from the origin through an AWS dedicated low-latency private lines.
- `Why Region specific resources?` - To satisfy legal regulatory, compliance (Eg: GDPR Policy), proximity, redundancy, reduce latency.
- Example of Edge Services - CDN and Global Accelerator

- `On-Prem:` Customer managers from Network, Virtualization to App Everything. This setup requires operational experts and capital expenditure.
- `IaaS:` Customer manages from OS to App. AWS Manages the underlying infra, but customer is responsible for OS, runtime to application (Eg: EC2)
- `PaaS:` Customer manages Data and App. AWS Manages the underlying infrastructure, OS and Runtime (Eg: Elastic Bean Stalk)
- `FaaS:` Function as service, customer writes and deploys the code logic as function (Eg: Lambda)
- `SaaS:` Customer doesn't manage anything. (Eg; Rekognition)

