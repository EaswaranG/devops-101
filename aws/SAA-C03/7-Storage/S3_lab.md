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


**Step 4:** Now we will implement a replication rule. To implement a `replication rule`, we need `two buckets`. Navigate to S3 landing page and click create a bucket, this time choose a `different region` for `cross-region replication`. (This can be done in same region as well, but practically cross-region replication gives high availability).

![S3 Replica Bucket](/aws/SAA-C03/assets/.labImages/S3/S3ReplicaBucket.png)


**Step 5:** Configure replication on the source bucket by selecting your `source bucket` (ca-central-1) -> Navigate to `Management` tab -> Scroll to `Replication` and click `Create replication rule`.

![S3 Replica Bucket 2](/aws/SAA-C03/assets/.labImages/S3/S3ReplicaBucket2.png)


**Step 6:** Setup the replication rule -> Click create replication rule -> Give a unique name -> Choose the status as `Enabled` -> Source bucket is selected by default, but choose `rule scope` (Either for all objects or for a path)

![S3 Replica Bucket 3](/aws/SAA-C03/assets/.labImages/S3/S3ReplicaBucket3.png)

**Step 7:** Setup the replication destination in the same AWS account or in different AWS account. This requires IAM role with S3 replication policy. Replicated bucket can be encrypted using KMS and storage class can be changed.

![S3 Replica Bucket 4](/aws/SAA-C03/assets/.labImages/S3/S3ReplicaBucket4.png)

**Step 8:** Setup IAM Role and policy.

```json
Policy
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "s3ReplicatePolicy",
            "Effect": "Allow",
            "Action": [
                "s3:ReplicateObject",
                "s3:ReplicateDelete"
            ],
            "Resource": "arn:aws:s3:::easwar-s3-replica-bucket/*"
        }
    ]
}
```

```json
Trust Policy
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "s3.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```
Click save the rule -> Replication Rule is now enabled.
![S3 Replica Bucket 5](/aws/SAA-C03/assets/.labImages/S3/S3ReplicaBucket5.png)

**Step 9:** Configure a lifecycle policy. Lifecycle policies automatically transition or expire objects based on rules you define. 
Navigate to the source bucket by selecting your `source bucket` (ca-central-1) -> Navigate to `Management` tab -> Scroll to `Lifecycle Configuration` and click `Create lifecycle rule`. Refer Step 5 screenshot.

![S3 Lifecycle Rule](/aws/SAA-C03/assets/.labImages/S3/S3LifecyleRule.png)

![S3 Lifecycle Rule 2](/aws/SAA-C03/assets/.labImages/S3/S3LifecycleRule2.png)

![S3 Bucket Management](/aws/SAA-C03/assets/.labImages/S3/S3BucketManagement.png)

**Step 10:** Enable Static Website Hosting from source bucket -> `Properties` tab -> Scroll to `Static website hosting` and click `edit` -> Choose `Enable` and set `Index Document` as `index.html` and error document as `error.html` and save.

![S3 Static Hosting](/aws/SAA-C03/assets/.labImages/S3/S3StaticHosting.png)

**Note:** Access is blocked by default unless Access Control List (ACL) is set to allow or the bucket policy is updated.
![S3 Static Hosting Access Denied](/aws/SAA-C03/assets/.labImages/S3/S3StaticHostingAccessDenied.png)

**Step 11:** Navigate to Bucket -> `Permissions` tab `Bucket Policy` -> Edit -> Add the below policy.
```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "PublicReadGetObject",
			"Principal": "*",
			"Effect": "Allow",
			"Action": [
				"s3:GetObject"
			],
			"Resource": [
				"arn:aws:s3:::easwar-s3-demo/index.html",
				"arn:aws:s3:::easwar-s3-demo/error.html"
			]
		}
	]
}
```

![S3 Bucket Policy](/aws/SAA-C03/assets/.labImages/S3/S3BucketPolicyUpdate.png)

**Step 12:** Navigate back to public access settings and make sure all public access is blocked. The access is given only through bucket policy.

![S3 Bucket Policy](/aws/SAA-C03/assets/.labImages/S3/S3BlockPublicAccess.png)


**Step 13:** Upload Website content as index.html and a error page error.html in the bucket. This static webpage will be hosted by S3 based on our previous config.

![S3 Upload Object](/aws/SAA-C03/assets/.labImages/S3/S3UploadObject.png)

**NOTE:** Object creation would have triggered an Email event notification which we configured before, check the email for more details.

![S3 Notification](/aws/SAA-C03/assets/.labImages/S3/S3TestNotification.png)

**NOTE:** Validate the replicated object.
![S3 Replicated Object](/aws/SAA-C03/assets/.labImages/S3/S3ReplicateObject.png)

**Step 14:** Navigate to bucket -> Properties -> Scroll down to see `Static Website hosting` -> open the `Bucket Website endpoint` link to see your website.

![S3 Website Endpoint](/aws/SAA-C03/assets/.labImages/S3/S3WebsiteEndpoint.png)

*Note*: Open the link in browser.
![S3 Website Preview](/aws/SAA-C03/assets/.labImages/S3/S3WebsitePreview.png)


This is end of S3 lab. There are many more options S3 has, like Requester Pays, Object Lock, Transfer Acceleration etc. Refer to AWS documentation to learn more.

*Note*: Clean up the S3 by deleting the objects, removing configurations and delete buckets. 
--------