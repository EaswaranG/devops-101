## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Autthor Easwaran Govindarajan

## AWS SQS - Simple Queue Service

###### Create an SQS Queue, send a message and poll/receive the message

**Step 1:** Navigate to AWS Console and search for `SQS` -> `Create a Queue` -> Enter a Queue Name and select a queue type. Most requirements would suite standard queue type where the messages don't have to follow an order, SQS uses a best-effort ordering and these message can be marked to deliver to consumer multiple times by tweeking the configurations.

![SQS Creation](/aws/SAA-C03/assets/.labImages/SQS/SQSCreation.png)

**Step 2:** SQS must use an Encryption-In-Transit either by SQS Key or KMS Key.

![SQS Creation 2](/aws/SAA-C03/assets/.labImages/SQS/SQSCreation2.png)

There are two `optional configs` you can configure which is
- `Redrive Allow Policy`: The redrive allow policy defines which source queues can use this queue as the dead-letter queue.

- `Dead-letter queue`: If a message can't be consumed successfully, you can send it to a dead-letter queue (DLQ). Dead-letter queues let you isolate problematic messages to determine why they are failing.

**Step 3:** Once SQS queue is created we have some options for subscription configuration, send or receive messages or empty the queue by purging.  

![SQS Created](/aws/SAA-C03/assets/.labImages/SQS/SQSCreated.png)

**Step 4:** Send a test message to the queue by clicking `Send and receive messages`.

![SQS Send Message](/aws/SAA-C03/assets/.labImages/SQS/SQSSendMessage.png)

**Step 5:** `Poll for messages` to see the messages in the queue.

![SQS Poll Message](/aws/SAA-C03/assets/.labImages/SQS/SQSPollMessages.png)

**Step 6:** This message will stay in the queue until it is consumed or the retention period is met. Since our lab is completed, we can now `purge the messages` and delete the queue for cleanup.

![SQS Purge Messages](/aws/SAA-C03/assets/.labImages/SQS/SQSPurge.png)
![SQS Clean up](/aws/SAA-C03/assets/.labImages/SQS/SQSCleanup.png)

----------