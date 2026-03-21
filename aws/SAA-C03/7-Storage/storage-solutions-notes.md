## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## Storage Solutions Overview

- S3: Object Storage for unstructured data
- S3 Glacier: Archival solution for object storage for infrequent access
- EBS Volume: Block Storage for EC2 instance
- Instance Storage: High IOPS Physical storage for EC2 (Ephemeral)
- EFS: Network File system for Unix and Linux - Installs ENIs in 3 AZs for high availability
- Distributed File System Storage
    - FSx for Windows: Windows File System with SMB and NTFS support
    - FSx for Lustre: High Performance Computing for Linux
    - FSx for NetApp ONTAP: Network File System with High OS Comptability (Propriatery FS)
    - FSx for OpenZFS: Open-source ZFS
- Storage Gateway: Hybrid Cloud Bridge 
    - S3 File Gateway
    - FSx File Gateway
    - Volume Gateway
    - Tape Gateway
- Transfer Family: FTP(s) support for S3/EFS
- DataSync: Automates DataSync between on-prem and AWS.
- Snow Family: Physical Devices (deprecated now) movement like `Snowcone/Snowball/Snowmobile` for large data transfers. Use DataSync or Storage Gateway instead.

## AWS Storage Gateway

- Acts as a bridge between on-prem and cloud storage, enabling hybrid cloud environment.
- This can be attached in a on-prem running VM. 

- **Types of Storage Gateway**
    - S3 File Gateway: S3 storage
    - FSx File Gateway: Enables on-prem access to AWS FSx for Windows natively (N/A for new users since 2024)
    - Volume Gateway: Offers `block storage` -> Lands in `S3` and can be `moved to EBS` using `AWS Backup`.
    - Tape Gateway: Archival to `AWS Glacier`.

- `Flow:` On-Prem DB/App Server --> NDS/SMB ---> File Gateway --> HTTPS --> AWS Cloud FSx File/Volume Gateway

--------

## AWS Transfer Family

- Is a fully-managed service for `secure file transfer` to `AWS S3 or EFS` using standard protocols like `FTP(s),SFTP, AS2`
- Creates a FTP Endpoint for legacy application which can not connect to S3 or EFS directly, instead using AWS Transfer Family we can move the data to S3.

--------

## AWS DataSync

- Install DataSync Agent in `on-prem storage` which supportss NFS, SMB, HDFS and S3 API for `transfering large amount of data` to AWS cloud to `S3, EFS or FSx Storage` with TLS1.2.
- This is `not a Hot Sync`, instead batch based migration of data from on-prem to AWS Cloud.
- In AWS Region to Region data movement we can use DataSync service.

--------

