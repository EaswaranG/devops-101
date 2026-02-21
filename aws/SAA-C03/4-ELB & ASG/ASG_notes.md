# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS ELB - Elastic Load Balancer

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
    