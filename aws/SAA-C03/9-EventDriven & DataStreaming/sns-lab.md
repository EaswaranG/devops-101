## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Autthor Easwaran Govindarajan

## AWS SNS - Simple Notification Service

###### Create an SNS topic and publish an test email message.

**Step 1:** Navigate to AWS Console and search for `SNS` -> `Create a Topic`

![SNS Topic](/aws/SAA-C03/assets/.labImages/SNS/SNSTopic.png)

**Step 2:** Navigate to AWS Console and search for `SNS` -> `Create a Topic`

![SNS Topic 2](/aws/SAA-C03/assets/.labImages/SNS/SNSTopic2.png)

![SNS Topic 3](/aws/SAA-C03/assets/.labImages/SNS/SNSTopic3.png)

**Step 3:** Test the topic by publishing an message, but the topic don't have any subscription associated with it yet, this message has no queue to hold, or no endpoint to go, thus this will be discarded immediately.

![SNS Publish Mesage](/aws/SAA-C03/assets/.labImages/SNS/SNSPublishMessage.png)

MessageID don't have retained message flag.
![SNS Publish Mesage 2](/aws/SAA-C03/assets/.labImages/SNS/SNSPublishMessage2.png)

**Step 4:** Create an SNS Subscription by navigating to `SNS` -> `Subscription` -> `Create a subscription` -> select type from the list, in our lab we will use `Email` subscription.

![SNS Subscription](/aws/SAA-C03/assets/.labImages/SNS/SNSSubscription.png)

Navigate to email and confirm the subscription.

![SNS Subscription Confirmation](/aws/SAA-C03/assets/.labImages/SNS/SNSSubscriptionConfirmation.png)

After confirming the email, navigate back to subscriptions and notice the subscription status is `confirmed`.
![SNS Subscription Confirmation](/aws/SAA-C03/assets/.labImages/SNS/SNSSubscriptionConfirmed.png)

**Step 5:** `Publish a message` to the topic again, now the topic has subscription, this message will be received by email.

![SNS Subscription 2](/aws/SAA-C03/assets/.labImages/SNS/SNSSubscription2.png)

Navigate to email inbox and look for the test email received. This email will have an link to unsubscribe, this will mark the subscriptions as deleted.

![SNS Subscription 3](/aws/SAA-C03/assets/.labImages/SNS/SNSSubscription3.png)

This is the end of SNS lab, we have created a topic and email subscription and tested it. Once the usage is completed, clean up by deleting subscription and topic.

---------