## Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS FSx Distributed File System
Amazon FSx Storage is a storage solution provided for enterprise grade `distributed storage` solutions. Its a `fully managed third party file system`.

- `FSx for Windows File Server` 
    - Windows file server (NTFS, SMB Protocol to connect to UNIX)
    - Active Directory support
- `FSX for Lustre` 
    - Linux file server
    - High performance, parallel distributed file system optimized for large-scale computing like `Machine learning`
    - Along with `Persistent File System`, Lustre supports `Scratch storage` (not a persistent) for a temporary high performance storage
- `FSx for NetApp ONTAP` 
    - Fully managed NetApp file system on AWS (NetApp is a external storage solutions vendor). Compatible with Linux, Windows, MacOs etc.
- `FSx for OpenZFS` 
    - Alternative of NetApp ONTAP, Opensource ZFS storage to avoid vendor lock-in.