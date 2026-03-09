# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Global Accelerator

#### Notes
- Unicast IP (1 to 1) vs Anycast IP (1 to 1 of many) Multiple devices has same IP
- Works on `Transport Layer` (TCP/UDP Layer)
- Routes the requests via `AWS Intenal Network` for traffic efficiency
- Automatically assigns `2 Anycast IPs` for HA and fault tolerance.
- Routes to near by edge location.
- Integrates with EC2, ALB, NLB, Elastic IP, AWS Shield.
- It is to take `optimized network route`.