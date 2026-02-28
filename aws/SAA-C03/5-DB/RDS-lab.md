## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS RDS - Relational Database Service

###### Create a RDS DB and Connect Using local DB Viewer

**Step 1:** Login to AWS Management Console and in the search box, navigate to `Aurora and RDS` -> Under Dashboard, click DB Instances -> Create new DB.

![RDS Wizard 1](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard1.png)

**Step 2:** Choose DB of your choice, AWS offers two DB Engines.
- `Aurora` (MySQL and Postgres compatible) -> High Performance Enterprise grade Instance, where compute and storage are separated gives 5x more performance. Also comes with higher cost.
- `RDS` (MySQL, Postgres, MariaDb, Oracle, MSSQL Server, IBM Db2) -> Traditional Relational Database Managed by AWS.

`In the Lab session, we will create Aurora Postgres with Reader and Writer Instance`

![RDS Wizard 2](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard2.png)

**Step 3:** Choose which Instance type you want to launch
- `Dev/Test instance` (which uses `serverless v2` - *0.5 to 128 ACU* which is *~0.070 USD/hour to ~17.920 USD/hour*)
- `Production instance` a larger instance like `db.r7g.2xlarge` will be used which is *8 vCPU and 64GiB RAM* (*~$2.432/hr*)

![RDS Wizard 3](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard3.png)
**Note:** Secret Manager will cost ~$0.40/month per secret.

**Step 4:** Choose the Instance configuration based on your workload requirement. Choose standard if your application is not expected to have high usage of DB like thousands of writes and reads per second.

![RDS Wizard 4](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard4.png)

**Step 5:** Choose the Availability settings and connectivity settings as shown in the screenshot.

![RDS Wizard 5](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard5.png)

**Step 6:** Choose the VPC and subnet settings, and some additional settings available optionally at extra cost.

![RDS Wizard 6](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard6.png)

**Step 7:** Choose the Monitoring options, standard option comes with CPU metrics, write and reader metrics (Infra level), however if you want advance insights such as Slow Queries, SQL Statement level details, then opt for advance insights at extra cost.

![RDS Wizard 7](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard7.png)

**Step 8:** Add optional tags and review additional settings and click `Create Database`. By default writer instance is created. Go to Actions -> Click `Add Reader` to create a reader instance.

![RDS Wizard 8](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard8.png)

**Step 9:** Get the connection string from the cluster instance (don't use reader/write url directly)

![RDS Wizard 9](/aws/SAA-C03/assets/.labImages/RDS/RDSWizard9.png)

**Step 10:** Get the Password from AWS Secrets Manager.

![RetriveSecret](/aws/SAA-C03/assets/.labImages/RDS/RetriveSecret.png)

**Step 11:** Update/Review the security group if the inbound rule is added to open DB port.

![Security Group Update](/aws/SAA-C03/assets/.labImages/RDS/SecurityGroupPort.png)


**Step 11:** Install SQL viewer, in our example we are using `DBeaver` on Mac. We installed using homebrew. You can find more information on their official page for installation.
`brew install --cask dbeaver-community`

![DBeaver](/aws/SAA-C03/assets/.labImages/RDS/DBeaver1.png)

**Step 12:** Open `DBeaver` -> `Create New Connection` -> Select `Postgres` -> Enter `host name`, `database name`, `user name`, `password`, `port number` and connect.

![DBeaver 2](/aws/SAA-C03/assets/.labImages/RDS/DBeaver2.png)

**Step 13:** Once connected, open SQL script and start using the Database from the Dbeaver.

![DBeaver 3](/aws/SAA-C03/assets/.labImages/RDS/DBeaver3.png)


That is the end of module, there are many more settings and configs and options RDS and Aurora offers, for a production grade system, follow AWS 6 pillars practice and recommendations.
------