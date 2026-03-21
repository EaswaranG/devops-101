## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Autthor Easwaran Govindarajan

## Amazon Kinesis Services
##### Collect, process, and analyze data streams in real time.

###### Create an S3 Bucket, a Kinesis Data Stream and a Firehose delivery stream, Simulate sending data to the Kinesis Data Stream, verify that Firehose picks it up, and check that the data appears in S3


###### Create an Regional S3 Bucket from our previous lab

Navigate to AWS Console and search for `S3` -> `Create a S3 Bucket` and set up a destination bucket where Firehose will store your data.

![S3 Bucket](/aws/SAA-C03/assets/.labImages/kinesis/S3Bucket.png)


###### Create an Kinesis Data Stream which we can put data records

Navigate to AWS Console and search for `Amazon Kinesis` -> select `Data streams` -> `Create data stream` and set up a destination bucket where Firehose will store your data.

![Kinesis Data Stream](/aws/SAA-C03/assets/.labImages/kinesis/KinesisDataStream.png)

**Step 1:** Create a provisioned data stream with 1 shard.

![Kinesis Data Stream Creation](/aws/SAA-C03/assets/.labImages/kinesis/KinesisCreation.png)

**Step 2:** Wait for the stream to change active status.

![Kinesis Data Stream Created](/aws/SAA-C03/assets/.labImages/kinesis/KinesisDataStreamCreated.png)

###### Create an Kinesis Data Firehose Delivery Stream

**Step 1:** Navigate to `AWS Console` -> `Kinesis Firehose` -> Create a new Firehose 

![Kinesis Fire hose Creation](/aws/SAA-C03/assets/.labImages/kinesis/FirehoseCreation.png)

**Step 2:** Select `Source` as `Data Stream` which we created in the previous section and `Destination` as `S3 Bucket` created from previous section.

![Kinesis Fire hose Creation 2](/aws/SAA-C03/assets/.labImages/kinesis/FirehoseCreation2.png)

![Kinesis Fire hose Creation 3](/aws/SAA-C03/assets/.labImages/kinesis/FirehoseCreation3.png)

**Step 3:** Create an IAM Role with neccessary permission for S3 bucket and Kinesis

![Kinesis Fire hose IAM](/aws/SAA-C03/assets/.labImages/kinesis/IAMCreation.png)
![Kinesis IAM Trusted Entities](/aws/SAA-C03/assets/.labImages/kinesis/IAMTrustedEntities.png)

**Step 4:** Once Firehose is created we can test the firehose with sample message.

![Kinesis Fire hose Creation 4](/aws/SAA-C03/assets/.labImages/kinesis/FirehoseCreation4.png)

**Step 5:** Test data with the sample data stream.
If the test is successful, you will see demo records in this destination: easwar-cac1-firehose-bucket-<accountNumber>-ca-central-1-an. If you navigate away from this page while the demo data is being sent, we will stop sending the demo data.

![Kinesis Test Demo Data](/aws/SAA-C03/assets/.labImages/kinesis/TestStreamWithDemoData.png)

**Step 5:** Navigate to S3 Bucket to see if this has created the Object.

![Kinesis Test Data ](/aws/SAA-C03/assets/.labImages/kinesis/FirehoseTestData.png)

https://docs.aws.amazon.com/streams/latest/dev/fundamental-stream.html

![Kinesis Test Data 2](/aws/SAA-C03/assets/.labImages/kinesis/FirehoseTestData2.png)


This is the end of Kinesis Stream lab, we can clean up the resources once testing is completed. Kinesis is charged in hourly cost.

--------