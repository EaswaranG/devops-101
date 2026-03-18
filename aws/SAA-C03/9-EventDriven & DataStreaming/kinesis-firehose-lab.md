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
