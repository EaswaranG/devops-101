## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Elastic Beanstalk


###### Deploy a Sample Application in a web tier using elastic beanstalk

**Step 1:** Navigate to AWS console and search for Elastic Beanstalk -> Click Create Application

**Step 2:** Create an application by giving an app name and description. In another wizard we will create an environment. When you create for the first time, both App and Environment might be created in a same wizard.

![Beanstalk App Creation](/aws/SAA-C03/assets/.labImages/Beanstalk/beanstalkAppCreation.png)

**Step 3:** Using new workflow we can create Environment (Legacy workflow also be used to do the same setup).
**Note:** The beanstalk will create an EC2 instance, and an IAM role to access the EC2 instance and another IAM role for the service-role which is used for enhancedHealth and managed updates.

![Beanstalk Env Creation](/aws/SAA-C03/assets/.labImages/Beanstalk/beanstalkEnvCreation.png)

**Step 4:** Click create -> Now navigate back to Elastic Beanstalk -> Environments -> The app which you created.

![Beanstalk App Created](/aws/SAA-C03/assets/.labImages/Beanstalk/beanstalkAppCreated.png)

**Step 5:** Open the domain name in a browser, this can be accessbile by public because of the network settings default we created with an public IP.

![Beanstalk App URL](/aws/SAA-C03/assets/.labImages/Beanstalk/beanstalkAppURL.png)

**Step 6:** You can monitor the application's performance from the Monitoring tab which exposed few basic cloudwatch metrics.
- In the `health tab` -> You can monitor req/second, response code counts, latency etc
- In the `monitoring tab` -> CPU utilization and other metrics related health and performance
- In the `logs tab` -> You can request for full log or last 100 lines of log and download them for troubleshooting.
- In the `alarms tab` -> You can setup CloudWatch Alarms.

![Beanstalk App Monitoring](/aws/SAA-C03/assets/.labImages/Beanstalk/beanstalkMonitoring.png)

![Beanstalk App Logs](/aws/SAA-C03/assets/.labImages/Beanstalk/beanstalkLogs.png)

**Step 6:** You can update the existing configuration, or upload a new code or modify any network changes everything from the below marked options. Once the application usage is completed, remember to `delete the application`.
*Note:* If you delete the application, it will delete the environment, the ec2 instance (IAM role not deleted), and the network configs related to that.

![Beanstalk App Deletion](/aws/SAA-C03/assets/.labImages/Beanstalk/beanstalkDelete.png)


This is the end of lab, more information about Elastic Beanstalk can be found in the [AWS official documentation](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html).

-------