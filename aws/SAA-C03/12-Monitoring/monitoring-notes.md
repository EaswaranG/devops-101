## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS Monitoring Tools

- `Cloudwatch` - Log and metrics monitoring service
- `Cloudtrail` - API Activity, Audit logs and event logs
- `EventBridge` - Based on a event, triggers an action
- `AWS Config` - Standard/Compliance enforcing service

-------

##### AWS Cloudwatch

- Collects logs from log stream and log groups.
- Rention period from 1 day to 10 years or keep kogs indefinitely.
- CloudWatch can monitor almost all of AWS services to extract metrics, sets up alarms, scaling events can be configured based on the metrics.
- CW logs can be stremaed to firehose in realtime and connect your data pipeline.
- CW `Metrics streams` can be streamed to thirdparty services such as Splunk, Dynatrace etc.
- Monitoring Top metrics using CW `Log Insights` such as container insights, DB Insights etc.
- `Queries` can be run directly on the logs for searching and analysis.
- Can export the data to S3 and use Athena to search further.
- CW subscriptions can be configured to filter the data and send only relevant logs. Connects a lambda for data transformation and filtering.
- AWS supports shipping of logs to a different account, in a large organizations, you can create a separate monitoring account and all logs can be shipped to monitoring account from all other AWS accounts to enforce compliance and easily manage.
- Sending EC2 logs to CW using CW Agent on EC2 instance or on-prem VM.
- `CloudWatch Unified Agent` and `CW Logs Agent`.
- Unified Agent can read fine grained metrics and ships to AWS CloudWatch from EC2 instance or on-prem server.
