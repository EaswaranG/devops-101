## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Global Accelerator

###### Setup Global Accelerator by running two EC2 Instance with two webpages

**Step 0:** Create two EC2 Instance in two regions with two web pages.

![Global Accelerator EC2](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-EC2.png)

-------

**Step 1:** Create a `Global Accelerator`, Navigate to AWS Console -> `AWS Global Accelerators` -> Create Accelerator.
**Note:** `Global Accelerator is a global service.`

> To create an accelerator, you must have the necessary permissions, including permission to create a required service-linked role.


![Global Accelerator Wizard](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-Wizard.png)

**Step 2:** Create `listener` for HTTP and HTTP(s) under TCP or UDP, in our case we are using TCP HTTP connection, so add TCP:80 port.

**Note:** `Client Affinity` -> If you have stateful applications with a standard accelerator, Global Accelerator can direct all requests from a user at a specific client IP address to the same endpoint resource, to maintain client affinity.

![Global Accelerator Wizard 2](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-Wizard2.png)

**Step 3:** Add `Endpoint Groups` -> Here you can configure port override and Healthcheck calls optionally. For our example we can configure HealthCheck.
Add one Group for `ca-central-1` and one group for `ap-south-1`

![Global Accelerator Wizard 3](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-Wizard3.png)

**Step 4:** Add `Endpoints` as `EC2 Instance` for each `Endpoint Group` and select the EC2 instances which we created in each region.

![Global Accelerator Wizard 4](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-Wizard4.png)

**Step 5:** Click `Create Accelerator` and this will take few minutes to create and enable. Once created, we can use the `DNS Name` of the global accelerator in the browser and notice the traffic is routed to the EC2 instance.

![Global Accelerator Wizard 5](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-Wizard5.png)

**Step 6:** **Validation:** Validate the accelerator by opening the `DNS name in browser`.
Note: I've updated the traffic Dial as 50% and 50% to show the change for this lab. 
In the below screenshot, we have connected VPN and reload the DNS name to see the traffic is routed to a different region.

![Global Accelerator Wizard 6](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-Wizard6.png)

**Step 7:** If we stop the web server on one instance to simulate a failure and see the Global Accelerator automatically routes traffic to the healthy endpoint. 

![Global Accelerator Wizard 7](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/GA-Wizard7.png)

This is the end of Global Accelerator Lab, cleanup the resources when not used. `Disable Accelerator` takes about 5 mintues to disable before deleting.

------