## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS S3 - Amazon Simple Storage Service

###### Create an S3 bucket and static host a website with versioning and replication rule with event notifications

**Step 1:** Navigate to AWS Console and search for S3 -> Create a bucket. Fill in the bucket information and create a bucket. Refer the screenshots below.
*Note:*
Amazon recommends disabling ACLs, unless you need to control access for each object individually. Use bucket policy instead of ACL.

![S3 Bucket Creation 1](/aws/SAA-C03/assets/.labImages/S3/S3Creation1.png)

![S3 Bucket Creation 2](/aws/SAA-C03/assets/.labImages/S3/S3Creation2.png)

**Note:** In this bucket we have enabled bucket versioning, s3 bucket key encryption, disabled ACL and using bucket policy, and we didn't enable public access to this bucket and objects. We will revist that when we host a static website.

![S3 Bucket Creation 3](/aws/SAA-C03/assets/.labImages/S3/S3Creation3.png)

**Step 2:** Now we can configure Event Notification. Navigate to the `S3 bucket` which we created -> Select `properties` tab -> Scroll down to see `Event Notifications` -> click `Create event notification`.

![S3 Event Notification](/aws/SAA-C03/assets/.labImages/S3/S3EventNotification.png)

**Step 3:** Setup a destination for the event. This destination can be a simple notification like an email, a compute power like lambda or simply send to a queue

**PreReq: Create an SNS Topic and a subscriber**
![SNS Topic](/aws/SAA-C03/assets/.labImages/S3/SNSTopic.png)

*Note:* Add permission to your SNS topic for S3 bucket to publish an notification.
![SNS Topic 2](/aws/SAA-C03/assets/.labImages/S3/SNSTopic2.png)

Select your SNS topic from the list, if no problem with the Topic Access permission, this user notification will be created.
![S3 Event Notification 2](/aws/SAA-C03/assets/.labImages/S3/S3EventNotification2.png)

![S3 Event Notification 3](/aws/SAA-C03/assets/.labImages/S3/S3EventNotification3.png)


**Step 4:** Now we will implement a replication rule. To implement a `replication rule`, we need `two buckets`.