# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS S3

- AWS S3 is an `Object storage`, unlike EBS or EFS `we can not mount this type of storage` to an compute instance. 
- `Bucket`: Place where a S3 Objects are stored internally. Bucket name should be unique and this bucket can be universally accessible.
- Uses `Flat File` structure.
- `ACL:` Amazon recommends disabling ACLs, unless you need to control access for each object individually or to have the object writer own the data they upload. Using a bucket policy instead of ACLs to share data with users outside of your account simplifies permissions management and auditing.

## S3 Security
- `Encryption:` When a bucket is created we have 3 types of encryption available.
    - Encrypt/Decrypt using `S3 Managed Bucket Keys`
    - Encrypt/Decrypt using `KMS Keys` (AWS or Customer Managed keys) -> Makes an API call to AWS KMS, `monitor the KMS Quota`
    - Encrypt/Decrypt using `Dual Layer KMS Key` (Additional cost)
- Enforce `SSL`: Force `Encryption in Transit`.
- CORS enabled, MFA Protection.
- `Server Access logs` can be enabled, and write it to a different bucket for auditing purpose (Bucket policy must allow S3 service in principal)
- `Pre signed URLs` for temporary access to a private bucket.
- `Glacier Vault Lock`, `S3 Object Lock` are used to prevent tampering.
- `S3 Object Lambda`

## Notes
- S3 has Storage Class Intelligent Tier Transition. If a file has not acceesed for more than 30 Days (configurable)
- Objects can be reverse transition to standard storage class when object is accessessed. However when it is moved to glacier after too many days of unused days.
- `S2 Lifecycle Rules` Configuration lets you customize the storage class tier transitional manually based on rules.
- In lifecycle rule, we have an option `Permanently delete non-concurrent versions of objects` after x number of days while mainitaining y number of versions minimum. 
- `S3 Analytics` lets you see a analysis on how much object storage consumed in storage class level, region level etc. This will help us see how our storage can be optimized.
- `S3 Requester Pays` option lets your requester pay for the networking cost (Who ever wants to call S3 endpoint).
- `Transfer Acceleration` is a way of setting up an edge location for a region specific bucket can be reached from far away location.
- `Event Notification` lets you trigger a notification on a configured event. Like sending an email or computing something based on a event. Example: When Object is created or removed send an email notification. Or setup an automated workflows using,
    - `Lambda:` Serverless computing to run a workflow
    - `SNS:` Simple Notification Service, atleaset one subscription required for an SNS Topic. A subscriber can be another Lambda function too
    - `SQS:` Simple Queuing Service, a subsciber is required to read from the queue
- Enable `Event Bridge` to send data to default `Event Bus` to create event automations with 20+ AWS services.
- S3 can do `3500 PUT/COPY/POST/DELETE` and `5500 GET` per second per prefix which is a high performance storage system.
- S3 `Replication Rule` to replicate a bucket in same region or cross region. To replicate existing objects, a one-time `batch operation` would trigger. (Amazon S3 -> Batch Operations -> Create Job)
- `Storage Lens Tier` has two types
    - Free Tier
    - Advanced Tier: Gives prefix level cost metrics , data protection metrics and performance metrics