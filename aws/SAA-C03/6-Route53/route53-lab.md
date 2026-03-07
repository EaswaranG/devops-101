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

![Change NS](/aws/SAA-C03/assets/.labImages/Route53/ChangeNameServer.png)
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

**Step 1:** `Simple Routing Policy`
Create two A record types with simple routing policy where the primary is EC2 Public IP of Canada and secondary is India.