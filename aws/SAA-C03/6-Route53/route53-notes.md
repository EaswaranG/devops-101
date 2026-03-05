# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## DNS - Domain Name System

Domain Name system is used to resolve a domain name to IP address. Each server hosted publicly in the internet has an IP Address, but there are lots of websites with thousands of IP address and it is not humanly possible to remember them all. There comes DNS, each registered website will get a unique domain name, the DNS server's role is to resolve that domain name to its IP address.

##### How DNS Resolver works
- Browser checks local cache (if already visited)
- If cache miss -> Checks ISP's DNS resolver (Resolving Nameserver)
- If not found in Resolving Nameserver -> Goes to Root Name Server.(FQDN Registrar (like godaddy) will be in root (.) to find the zone file) -> Nameserver holds a directory to other nameservers for authorized directory.
- Routes to the TLD `(Top Level Domain)` server to find the TLD (.com/.net)
- Routes to Authoritative Namesever -> Which points to `Zone file` **(ROUTE53 is the server to host the zone file)**



- `Root (.)` -> `TLD (.com/.net)` -> 
- `local:/etc/hosts` -> `Resolving Nameserver` -> `Root Nameserver` -> `TLD Nameserver` -> `Authoritative Nameserver` -> `Web Server`

##### Route 53
- In Route 53, we create `Hosted Zone File` (It takes 24 hours for propogation)
- This will create `Name server records`
- This record will be added to `Authoritative Nameserver`
- You can also create simple records like `A` record, `AAA record`, `mx record` etc.

##### DNS Record Types

- `A Record (Address)` : Connects a website name to an IPv4 address (like example.com → 192.168.1.1).
- `AAAA Record` : Connects a website name to an IPv6 address (the newer, longer IP format).
- `CNAME Record (Canonical Name)` : Makes one domain name act like another domain name (an alias).
`⚠️ It cannot be used for the main/root domain (like example.com)`
- `MX Record (Mail Exchange)` : Tells the internet which server handles emails for the domain.
- `TXT Record (Text)` : Stores text information in DNS.
Often used for email security and domain verification (like SPF or DKIM).
- `NS Record (Name Server)` : Tells which servers are responsible for managing the domain’s DNS.
- `PTR Record (Pointer)` : Connects an IP address back to a domain name (reverse lookup).
- `SRV Record (Service)` : Tells where a specific service runs (for example, a SIP or LDAP server).
- `SOA Record (Start of Authority)` : Contains important details about the domain, like admin info and update settings.
- `Alias Records` : Special records that directly map to AWS resources, ideal for use with root domains. 


##### Notes
- Route 53 has 8 Routing policies such as `simple routing`, `weighted routing`, `Geolocation`, `Failover`, `IP Based`, `Latency`, `Multivalue answer`, `Geoproximity`.
    - `Simple Routing:` Adds A records, mx records, tx records. *(User -> Internet -> Domain Provider -> Route 53 -> EC2)*
    - `Weighted Routing` -> Routes based on weights, like 70% traffic to zone 1, 30% traffic to zone 2 likewise.
    - `Latency Routing` -> Routes based on less latency server.
    - `Failover Policy` - Used to switch traffic from one region to another region when there is a failure in the region (Active-Passive).
    - `Geolocation` - Geographical segregation of traffic, example Netflix.in and Netflix.com and Netflix.uk has different contents served based on geolocation.
    - `Geoproximity` - Sets up a proximity line based on a range and routes traffic in that proximity.
    - `Multivalue Routing` -  When you have multiple instances to be listed, (this is not a LB) this picks a random IP and sends the traffic to that endpoint.
    
- `Inbound Resolver` - Onprem -> AWS traffic
- `Outbound Endpoint Resolver` - AWS -> On-prem traffic