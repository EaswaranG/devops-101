# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS S3

- AWS S3 is an `Object storage`, unlike EBS or EFS `we can not mount this type of storage` to an compute instance. 
- `Bucket`: Place where a S3 Objects are stored internally. Bucket name should be unique and this bucket can be universally accessible.
- Uses `Flat File` structure.
- `ACL:` Amazon recommends disabling ACLs, unless you need to control access for each object individually or to have the object writer own the data they upload. Using a bucket policy instead of ACLs to share data with users outside of your account simplifies permissions management and auditing.