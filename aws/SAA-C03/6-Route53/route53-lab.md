## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Route 53


**Pre-Req: Purchase a domain from a `Domain Registrars` like GoDaddy, Hostinger etc**
- `Registry` owns the TLD (Top Level Domain). Example: VeriSign manages .com
- `Registrar` Sells domains to the public. Example: GoDaddy sells easwar.com
- `DNS Provider` Manages DNS records. Example: AWS Route 53, Cloudflare

###### Create a Route 53 Hosted Zone

**Step 0:**
In this lab, we will create a Hosted Zone for our domain we purchased from a registrar. I am using my domain `easwarang.space`.

![Domain NS](/aws/SAA-C03/assets/.labImages/Route53/DomainNS.png)

**Step 1:** Navigate to `AWS Console` -> Search for `Route 53` -> In the left pane, select `Hosted Zones` -> Click `Create hosted zone`

![Route53 Create Hosted Zone](/aws/SAA-C03/assets/.labImages/Route53/Route53CreateHostedZone.png)

**Step 2:** Enter the host name we purchased and select public hosted zone if our traffic is coming from internet. In our case we will select public hosted zone.

![Route53 Create Hosted Zone 2](/aws/SAA-C03/assets/.labImages/Route53/Route53CreateHostedZone2.png)

**Step 3:** Nameserver record will be auto created along with State Of Authority record. AWS has much more record types, refer to Route53-notes.md file for more information.

![Route53 Hosted Zone](/aws/SAA-C03/assets/.labImages/Route53/Route53HostedZone.png)

**Step 4:** Change the nameserver in your registrar with the new NS AWS Route 53 created.

![Change Nameserver](/aws/SAA-C03/assets/.labImages/Route53/ChangeRegistrarNameserver.png)

**NOTE: It takes around 24 hours to propagate, you can check in online DNS Propagation checker https://www.whatsmydns.net/#NS with your domain name.**

------

###### Create two EC2 machines in two regions

**Step 1:** Create a EC2 instance in the primary region. In our example Canada-Central-1 (cac1) is the primary region. While creating the EC2 instance, we have added a User Data with an HTML page. Your work load could be anything, a webpage or website fully modern or headless API.

![EC2 Primary](/aws/SAA-C03/assets/.labImages/Route53/EC2Primary.png)

![EC2 Primary Page](/aws/SAA-C03/assets/.labImages/Route53/EC2PrimaryPage.png)

**Step 2:** Create another EC2 instance in the secondary region. In our example Mumbai - ap-south-1 (aps1) is the secondary region. 

![EC2 Secondary](/aws/SAA-C03/assets/.labImages/Route53/EC2Secondary.png)

![EC2 Secondary Page](/aws/SAA-C03/assets/.labImages/Route53/EC2SecondaryPage.png)

------

###### Add DNS Records, Routing Policies and Test

Navigate to `Route 53` -> Select the `hosted zone` -> select `Create Record`

**Step 1:** **`Simple Routing Policy`** -> Simply routes the traffic based on domain name/ sub-domain name.
Create two A record types with simple routing policy where the primary is EC2 Public IP of Canada and secondary is India.

![Simple Routing](/aws/SAA-C03/assets/.labImages/Route53/SimpleRouting.png)

*Open browswer and enter your domain and subdomain name and see where the traffic is routed to*
![Simple Routing Result](/aws/SAA-C03/assets/.labImages/Route53/SimpleRoutingResult.png)

**Step 2:** **`Weighted Routing Policy`** -> Routes the traffic based on weight, higher the weight to a endpoint, higher the traffic is sent through that route.
Create two A record with weighted routing policy, primary with 80 and secondary with 20 with the same subdomain name and see the difference 80% of traffic goes the primary.

![Weighted Routing](/aws/SAA-C03/assets/.labImages/Route53/WeightedRouting.png)

**Note: We have to wait 60 seconds for the DNS to propagate. In my machine the DNS is still failing to resolve after propagation.**

![Weighted DNS Failure](/aws/SAA-C03/assets/.labImages/Route53/DNSFailed.png)

Lets Troubleshoot the issue step by step. First test the DNS record in AWS, then test it from local machine using `dig` command.

![Weighted DNS Test](/aws/SAA-C03/assets/.labImages/Route53/DNSTestRecord.png)

![Weighted DNS Cache Flush](/aws/SAA-C03/assets/.labImages/Route53/DNSCacheFlush.png)

After DNS Flush, the page is loaded. Notice 80/100 requests will go through Canada endpoint.

**Step 3:** **`Latency-Based Routing Policy`** -> Routes users to the region that provides the lowest latency.
Note: In our current example Canada central is nearest thus providing less latency than Mumbai node.

Create an A record with Latency Routing policy, In the region lets use only Mumbai, since we have only one record for this subdomain all traffic goes to Mumbai. (Note: My current location is far away for Mumbai which has higher latency, however there is only one A record for this subdomain now)

![Latency Routing](/aws/SAA-C03/assets/.labImages/Route53/LatencyRouting.png)

Now, lets add another `A record` for `latency.easwarang.space` subdomain with Canada-Central as region, expected behaviour is Canada Central has lesser Latency.

![Latency Routing 2](/aws/SAA-C03/assets/.labImages/Route53/LatencyRouting2.png)

**Step 4:** **`Failover Routing Policy`** -> This policy ensure that if the primary resource becomes unhealthy, Route 53 directs traffic to the secondary.

![Failover Routing](/aws/SAA-C03/assets/.labImages/Route53/FailoverRouting.png)

Failover Routing requires a Health Check to be created and attached in the A record.
![Health Check](/aws/SAA-C03/assets/.labImages/Route53/HealthCheck.png)

Lets open `failover.easwarang.space` in a browser and `invert the health check` and (optionally flush DNS cache) refresh the page. Notice the traffic failover to Mumbai region.

![Failover Routing 2 ](/aws/SAA-C03/assets/.labImages/Route53/FailoverRouting2.png)

**Step 5:** **`Geolocation Routing Policy`** -> This policy routes user based on their geolocation. If request originate from India (or nearby India), the Route 53 routes to Mumbai server. If the request comes from North America, it routes to our Canada Central server.

![Geolocation Routing](/aws/SAA-C03/assets/.labImages/Route53/Geolocation.png)

Lets open `geolocation.easwarang.space` in a browser and validate the traffic is routed to Canada-Central server and now use VPN to tunnel to differnt country (HongKong in our example) and refresh the page. Notice the traffic failover to the server in Mumbai region.

![Geolocation Routing 2](/aws/SAA-C03/assets/.labImages/Route53/Geolocation2.png)

-----------
**NOTE: There are many more routing policies and record types available in Route53 as shown below to try out.**

![Record Types](/aws/SAA-C03/assets/.labImages/Route53/RecordTypes.png)

![Routing Policies](/aws/SAA-C03/assets/.labImages/Route53/RoutingPolicies.png)


This is the end of our Route 53 Lab. Learn more from AWS Official Documentation.
-----------