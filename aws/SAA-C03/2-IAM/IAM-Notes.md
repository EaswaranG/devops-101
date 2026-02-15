# Getting started with AWS Solutions Architect Associate - SAA-C03
#### Author Easwaran Govindarajan

## AWS IAM - Identity and Access Management

What is AWS IAM ?
AWS IAM is a free global service used for Authentication and Authorization of user or an application to the AWS resources. The access control is enables
- `who` (identity) can do access the AWS Resources?
- `what` level of access the user or the application has to the AWS Resource?
- `which` resource the user or application has access to?
- `under what conditions` the user or application can access a resource ?
Note: AWS IAM follows the least privilege principle to restrict a user with a minimum required permissions.

## IAM Users, Groups, Roles, Policies
- `IAM user` is a individual user/application whom can access AWS resource. Each user has a unique IAM User name within an AWS account. (*Eg: admin / easwaran*)
- User can use `passwords` for AWS Console access, or `Access Keys` for AWS CLI and SDK access.
- `Group` is a collection of users with shared permissions. Remember this as a team in an org with similar permissions baseline. (*Eg: PlatformEngineers*) -> A user who is part of a group would be represented as "PlatformEngineers/easwaran"
- A policy evaluation follows the order of `Explicit Deny` -> `Explicit Allow` -> `Implicit Deny`. Remember IAM follows least privileged access policy.
- Example: We have two set of employees, who are part of two groups, which is ApplicationDevelopers and DatabaseAdmin. The ApplicationDevelopers will not have write access to DB Resouces and DBA's will not have write access to compute resources such as EC2, ECS.
- `IAM Role` is also defines policies and permissions however these are temporary permissions given often to a Service or application to access a AWS resource to perform a task or to get a temp security tokens.
- Common use case of IAM Role is for CICD pipeline to access a S3 bucket, or a EC2 instance to access another service or cross-account role.
- Combination of IAM User, Group and Role are called `IAM Principals`.
- An user or service will have to `assume a role` to get the access to another resource. (*Eg*: A Spoke Account wants to use a Hub account resource, the spoke account have to assume the hub account's IAM-Role and very important the Hub account IAM-Role must add the caller in its `trusted-entities`)
- An IAM Role will have a policy attached, which tells what level of access the user who assumes this role will get.
- `Policies` are the permissions for IAM Principals (Users, Group and Roles). Policy is written in JSON format.
- A policy can be attached directly to a singe IAM user, group or role called `Inline Policy`. Using inline policy is not a reusable approach, tagging a policy directly to a user creates management overhead.
- Key Elements in a policy are
    - `Effect:` State of the action, either Allow or Deny the action.
    - `Action:` A list of possible actions in an AWS resource. (*Eg: You can list all EC2 Instance is "ec2:Describe"*)
    - `Version:` - THe latest policy language version
    - `Statement` - One or more statements that define the permissions.

![IAM Role Policy Example](/aws/SAA-C03/assets/images/IAM-Role-Policy.png)

## IAM Access Analyzer and Credential reports
`Credentials Report:` Lists all IAM users, password policies and access keys for security checks.
`Access Advisor:` Shows which services an IAM user has recently used -> Remove unused permissions.
`IAM Access Analyzer:` Monitors and flags overly broad and risky policies.

## Access Keys
- Access Keys are token generated (in AWS Console) for an IAM User to be used in an automated workflow.
- For Authentication AWS requires an Password or a Access Key token, sharing password or using in an automation is less secure and AWS provides a better solution to use Access keys.
- *Note:* If someone gets hold of your access key, they get access to your AWS Resource, it is customer's biggest responsibility to store the keys secured and never store in plain text in repos or code.
- Access Key has two sections
    - Access Key ID -> This is like a username
    - Access Key Secret -> This is a token

## Best Practices:
    - Rotate the Access Key often
    - Never share or store the key in plain text
    - Use IAM Roles instead of long-term access keys where possible
## Use Case:
    - Access your AWS Compute Resources via AWS CLI (*Eg: EC2, ECS, Lambda*)
    - Local Development Environment
    - Third-Party Service to monitor or manage AWS resources.
    - Application running outside of AWS to access AWS resources. (*Eg: An on-prem hosted app wants to send email via AWS SimpleEmailService*)


## Security Best Practices
- Don't use Root Account for everyday use.
    - Use Root Account only for initial setup, protect the root user with MFA.
    - Use an IAM User instead.
- Create Individual IAM Users
    - No Credentials sharing.
- Use IAM Roles for AWS Services
    - AWS Services can be accessed via Access Key aswell, however customer has to store the key secured. Instead use an IAM Role and let resources assume roles for secure temporary credentials.
- Follow the principle of Least Privilege
- Enforce Strong Password Policies
- Enable MFA wherever possible
- Regular audit via IAM Access Analyzer and Credential Reports
- Use CloudTrail and track the IAM access

## Advanced IAM Topics
`IAM Federation:` Allows external identity providers such as Azure Entra ID, Okta, can access AWS using AD Groups and members instead of creating AWS IAM Users.

`Resource Based Policy:` This is a special policy where we can set policies directly to the resource itself. (*Eg: S3 Bucket Policy, SNS Topic Policy*). Also control who can access the resource and from which accounts.

`Cross-Account Access:` Create a role in the target account. Attach a trust policy that allows another AWS account or role to assume it. No need to create separate users in each account.
*Developer John (Group: Application Developers) ----John Assumes Role----> PROD Account --> PROD Account IAM Role returns a temp security credentials ---> John can now access a AWS resource.*

`Condition Keys:` This is a fine grained restrictions to the policies such as the sourceIP, prefix, requested region.
`Examples:` 
- aws:SourceIp – Restrict access to specific IPs.
- aws:RequestedRegion – Restrict actions to certain regions.
- s3:prefix – Restrict S3 access to specific folder paths

