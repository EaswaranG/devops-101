## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Cloudfront (CDN - Content Delivery Network)

###### Setup CDN by create an S3 bucket and static host a website and create CloudFront Distribution

**Step 1:** Create an S3 Bucket and setup static hosting using our previous s3-lab document.

![CDN Page](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNPage.png)

**Step 2:** Navigate to AWS Console and search for `CloudFront` -> Under Distributions section -> Create a new `Distribution`. Refer the screenshots below. 

![CDN Distribution](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNDistribution.png)

**Step 3:** Select a plan from the list, in our example we are selecting Free version as this is available with a tiered caching for our lab.

![CDN Plan](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNPlan.png)

**Step 4:** Enter the domain name and copy paste the DNS name from the static hosting of S3. 

![CDN Domain Name](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNDomainName.png)

**Step 5:** Select the S3 bucket you are hosting, or if static hosting is enabled, enter the domain name in the list, and for the settings, use the recommended settings.

![CDN Origin](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNOrigin.png)

**Step 6:** Web Application Firewall (WAF) is included with CDN in free tier at no extra cost. Review the settings and create a CDN.

![CDN WAF](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNWAF.png)

**Step 7:** Wait for the CDN to be deployed, it would take few minutes to deploy.

![CDN Deployed](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNDeployed.png)

**Step 8:** Open the `Distributed Domain Name` from CDN in the browser. `Validate` the page by tracking the response time and refresh multiple times to see the difference, content loading faster than first time.

If the content is cache in browser, try cache clear in local and refresh, see if it is loaded from CDN.

![CDN Hit](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNHit.png)

**Step 9:** Validate the WAF created in console if the request is reaching out CDN through WAF allowed rules. Navigate to AWS Console -> CloudFront -> Your `Distribution Name` -> `Security` -> `WAF` Metrics.

![CDN WAF Hit](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNWAFHit.png)

Monitoring and Logging:

![CDN Operational Troubleshooting](/aws/SAA-C03/assets/.labImages/CDN&Accelerator/CDNOperationalTroubleshoot.png)

This is the end of CDN Lab module, for enterprise level loads use a business plan instead of free plan to access much more features.
--------