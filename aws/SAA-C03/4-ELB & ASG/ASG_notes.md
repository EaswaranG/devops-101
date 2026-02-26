# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Auto Scaling Group

##### How Auto Scaling Groups work?
- By defining 
    - What (launch template / config)
    - Where (ASG)
    - When (Scheduled Action / scaling policy)
- Scaling policy defines the conditions to scale. There are 3 types,
    - Dynamic Scaling (adjusts capacity based on real-time metrics)
    - Predictive Scaling (adjusts capacity based on past data prediction)
    - Scheduled Scaling (scales at specified time)

- Limits: 
    - Minimum Size (Eg: Atleast 1 instance to run)
    - Desired Capacity (Eg: I want 2 instance to run all time)
    - Maximum Size (Eg: I can go up to 6 instances)
    - Scale out as needed (Eg: Scale down to 4 instances)
- Configure a launch template for ASG.

##### Automatic Scaling Policies
- **Dynamic Scaling Policy:** has 3 types
    - Step Scaling (Scales based on cloudwatch alarm with predefined steps)
    - Scheduled Scaling (scaling based on scheduled time)
    - Target Tracking Scaling (Automatic scaling to maintain a traget metric -> Eg: CPU 50% to be maintained)
- **Predictive Scaling Policy:** -> Uses Amazon's predictive analysis and ahead of the demand the scaling would happen. This requires past data to predict a behaviour.
- **Scheduled Scaling Policy:** -> As name states, it is based on a scheduled time.

##### ALB Features:
- `mTLS (Mutual TLS)` -> Two way authentication between client & server
- `Automatic Target Weights` -> Weighted Random Load Balancing
- `Layer 7 LB` -> LB both HTTP & HTTPs traffic
- `Security Features` -> Paired with VPC, ELB, Internet/Non-Internet facing
- `Outpost support` -> Managed H/W & on-prem (like Azure Stack Hub)
- `Protocol support` -> HTTP1, HTTP/2 & gRPC
- `TLS Offboarding` -> Encrypts client initiating SSL & TLS to LB
- `Sticky Sessions` -> Enable at Target level group -> Routes same client to same service
- `IPV6 Support` -> Redirection support, Fixed Response
- `Request Tracing` -> Appends "X-Amzn-Trace-Id" header
- `Websocket Support`
- `SNI` -> Server Name Identification -> Client indicates the hostname
- `Targets` -> EC2, IP Address, Lambda, ECS container (IP address type)
- `Content based routing` -> Host based, Path based, HTTP header, HTTP method, query string param, source IP address, CIDR based routing
- `Slow start mode` -> Avoids flooding new nodes
- `User Auth & Target optimizer` -> additional tools
- `Deregistration delay` -> Opposite to slow start, this is a graceful shutdown


##### ALB Integrations
- EC2
- AWS ECS
- Lambda
- Cert Manager
- WAF
- Cloudwatch
- Amazon Cognito
- Global Accelerator

##### Common ALB 5xx Errors:

- `502 Bad Gateway:` Target sends invalid/closed response, wrong TG port/protocol, app crash, HTTP2/gRPC mismatch.
    - `Fix:` Verify TG port/protocol, health check path, app logs, match HTTP/HTTPS/HTTP2, keep-alive
- `503 Unavailable:` No healthy targets (bad health check, SG/NACL blocks, scale lag).
    - `Fix:` Make targets healthy, open SG rules, correct health check, scale earlier, increase thresholds.
- `504 Timeout:` Backend too slow or ALB idle timeout hit.
    - `Fix:` Optimize backend, raise ALB idle timeout, add caching/async, tune the app/aproxy timeout.
- `500/502:` Spikes after deploy -> Not enough draining.
    - `Fix:` Increase deregistration delay, readiness/preStop, gradual rollout.
    
##### Notes
- ALB analyze HTTP headers to make routing decisions.
- ALB routes the request to the available application endpoints (distributed). Best suited for microservices & containarized applications.
- ALB can integrate with
    - AWS WAF
    - AWS Cognito
    - Global Accelerator, CDN etc.
- `Rules:` Determines how the LB routes requests to targets
- `Listeners:` are the protocols and port, ALB supports HTTP:80 and HTTPS:443
- When ALB Target is a ECS Task IP, this IP can change when task is updated/added/removed. ALB does not detect this change automatically/dynamically.
- ECS running in AWS VPC update the target `On Task Start or replacement`, ECS calls `Register Targets` and `Deregister Targets` appropriately.
- Flow Representation:
    - `Client -> Route 53 -> AWS Cert Manager -> ALB -> WAF`
    - `Client -> Route 53 -> AWS Cert Manager -> ASG -> EC2/ECS/Lambda -> AWS Cloudwatch/S3`

