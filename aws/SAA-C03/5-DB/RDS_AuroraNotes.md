# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## Understanding AWS Databases

##### DB Ports
- PostgreSQL RDS & Aurora: 5432
- MariaDB, MySQL (RDS & Aurora): 3306
- Oracle RDS: 1521
- MSSQL Server: 1433

##### AWS Managed DB services (RDS)
- Amazon RDS (Relational Database Service) is a managed DB service by AWS supporting MySQL, PG, MariaDB, Oracle, MSSQL and AWS Aurora.
- RDS automates tasks like backups, patching, monitoring, scaling and gives High Availability with multi AZ spread and read replicas.
- Integrates with VPC and secures the DB.
- RDS DB Storage scales to meeting growing demands.
- Manual and automatic scaling.
- `Read Replicas` - Enhance read scalability by `offloading read queries` from the primary DB. This is a Async replication.
- `Sync vs Async replication` -> Sync replication allows all nodes has all records available as soon as a write happens before returning success response (Eg: `Standby instance`). ASync will be used on `read-replicas`, this will sync all writen data from primary DB to read-replica and you can not write to read instance.
- RDS will `charge for network cost` as well, around $0.01/GB in and $0.01/GB out in cross AZ in private subnet and doubles in public subnet. In same AZ it is free.
- RDS Ensures Multi-AZ `High Availability` and Disaster recovery.
- Read replica will create a `Snapshot` and restores in the other instance in the background.
- `RDS Custom`: for Oracle and MS SQL Server provides more flexibility than standard RDS by allowing you to customize the DB Env to meet specific app needs by giving access to underlying system.

##### Amazon Aurora
- Aurora is a high-performance Relational DB which is Amazon properierty service compatible with MySQL and PostgreSQL.
- It features 
    - HA using Multi-AZ 
    - Scalability up to 128TB
    - Upto 15 Read replicas
    - Performance gains 5x MySQL and 3x PG using optimized storage
    - low-latency query
    - `Security` includes encryption at `rest (KMS Keys)` and in `transit using TLS (SSL Encryption)`, N/W Security, IAM, CloudTrail logs, RBAC, MFA.
    - Reliability stems from a fault-tolerant, distributed storage layer with six-way replication
    - Other featyres like continuous backups to S3, `Point-in-time recovery` (Very complex to setup without managed service), Aurora serverless for on-demand scaling
- Backups offers 1 to 35 days of retention period.

- Aurora's Architecture is built differently
    - **Separated compute** (Handles write and replicate operations and failover) **and storage layer** (replicated across 3 AZ and shared among all compute instance)
    - Write Quorom says atleast 4/6 nodes should be written to be a successful write.
    - Cluster Endpoint and Reader Endpoint and Writer Endpoint is separated.
    - Auto-scaling of compute instance can also be configured.
    - `Multi masters` / Global Database which can have master writer node in different AZ or Region.
    - `Global Aurora` will have separate replication server fleet instead of using compute layer of the DB instance
    - RPO of 1 second and RTP of 1 minute.
    - Integration with AWS SageMaker for ML-Specific operation.

- `Aurora Clone` - Fast DB Cloning, independent DB.
- `Amazon RDS Proxy` - Fully managed service that enhances performance, scalability and availability for RDS and Aurora DBs. Using this gives `connection pooling` to reuse the connections, automatic failover, performance.
- `Elastic Cache` - Caching layer in DB which increases performance of the DB. It supports Redis. Memcache and Vallkey (AWS service).

##### Notes
- `SSL` encrypts data to prevent eavesdropping and tampering during `transmission` of data from client to server. Attacks like packet sniffing can not listen to the data while transit.