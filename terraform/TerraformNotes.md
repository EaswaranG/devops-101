# Getting started with Terraform
## Author Easwaran Govindarajan

### What is Terraform?

Terraform is an **open-source Infrastructure as Code (IaC) tool** developed by **HashiCorp**. It allows you to **define, provision, and manage infrastructure** (servers, databases, networks, storage, etc.) in a **declarative way** using configuration files written in **HCL (HashiCorp Configuration Language)** or JSON.  

Instead of manually setting up infrastructure through cloud consoles, Terraform automates the process and ensures consistency across environments.
Remember -> `Code, Plan and Apply`

## Terraform Documentation
`https://developer.hashicorp.com/terraform/intro`

## 🔑 Key Points about Terraform
1. **Infrastructure as Code (IaC):**  
   You write configuration files that describe the desired state of your infrastructure. Terraform then makes sure the actual infrastructure matches this state.

2. **Cloud-Agnostic:**  
   Works with multiple providers like AWS, Azure, Google Cloud, Kubernetes, VMware, Oracle Cloud, and many more.

3. **Declarative:**  
   You define **what** you want (the end state), not step-by-step instructions on **how** to get there.

4. **State Management:**  
   Terraform maintains a **state file** (`terraform.tfstate`) that tracks your real infrastructure and detects changes.

5. **Execution Plan:**  
   Before applying changes, Terraform generates a plan (`terraform plan`) showing what it will do (create, update, or destroy resources).

6. **Idempotent:**  
   Running the same config multiple times won’t recreate resources unnecessarily — only changes are applied.

---

### ⚙️ Example

A simple Terraform config to create an AWS EC2 instance:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}
```

Running:

```bash
terraform init
terraform plan
terraform apply
```

➡️ Provisions the EC2 instance automatically.

---

#### ✅ In short
Terraform is like a blueprint + automation tool for infrastructure, ensuring environments are reproducible, consistent, and easy to manage.

---

## Terraform Setup
Download Terraform and install.
 - GUI : `https://developer.hashicorp.com/terraform/install`
 - CLI for Mac : `brew tap hashicorp/tap && brew install hashicorp/tap/terraform`

## Terraform Terms and commands

- `Providers`: Plugins for Terraform that connect to an external API or service and manage their resources (create, read, update, delete). All services with API's can be managed with Terraform. For example to access and manage github we need github provider. We can get the provider from Terraform Registry.`https://registry.terraform.io/`. Anytime you add a provider, you need to do terraform init again.
- Documentation: `https://registry.terraform.io/providers/integrations/github/latest`
- `Resources`: The components defined in Terraform that represent specific objects (like an AWS EC2 instance, an S3 bucket, or a Kubernetes pod) which are managed through a provider.

👉 Think of it like:
- Provider = the bridge to the service
- Resource = the actual thing being managed
![Terraform Intro Diagram](images/intro-terraform-apis.png)

- `terraform init`: Prepares your working directory for use with Terraform by initializing the configuration, downloading provider plugins, and creating the `.terraform` folder and `.terraform.lock.hcl` file. This step is required before running any deployments.
- `terraform plan`: Generates an execution plan, showing what actions Terraform will take and which resources will be created, updated, or destroyed when you apply the configuration.
- `state`: Represents the current state of your managed infrastructure. By default, state files are stored locally, but they can also be stored remotely (e.g., Terraform Cloud, S3 bucket) for collaboration and security.
- `terraform fmt`: Automatically formats your Terraform configuration files to follow standard style conventions.
- `terraform show`: Shows the current state or a saved plan. Use this to see the state without opening statefile. Defaults to HCL format.
- `terraform show -json | jq`: Formats in JSON format and beautify the lines.
- `Interpolation`: This is a String Concatenation in Terraform - To combine strings and variable values in Terraform, use the `${}` interpolation syntax. Example: `"terraform-repo-${random_id.random_decimal_id.dec}"`
- `terraform console`: Use the Terraform console to interactively inspect variables, outputs, and resource attributes. To specify a state file, run `terraform console -state="../state/terraform.tfstate"`.
- `count`: The `count` meta-argument lets you create multiple instances of a resource by specifying how many duplicates you want. Use `count.index` to reference the current index in the loop (starting from 0). This is useful for dynamically generating resource names or attributes, such as `"terraform-repo-${random_id.random_decimal_id[count.index].dec}"` or accessing a specific resource instance like `github_repository.repo[0].name`.
- `output`: Outputs are usually added at the end of terraform script to print and store the output of the terraform script. These are printed in the console and also stored in the state files. `terraform output -json repo-names`

### Setup local filesystem as default backend
Create a backend.tf file and declare the path where the statefile to be stored.
Run terraform init to initialize the backend.
Note: Initally the state file will not be created when terraform init, the state file will be created only after terraform apply.
```hcl
terraform {
    backend "local" {
        path = "../state/terraform.tfstate"
    }
}
```

## Terraform Files

- **providers.tf:** Defines all providers Terraform uses to manage resources.
- **backend.tf:** Specifies backend configuration for storing the Terraform state file.
- **main.tf:** Commonly used as the main configuration file, but any `.tf` files in the directory are processed together.
- **terraform.tfstate:** Stores the current state of managed resources. Created when you run `terraform apply` or `terraform refresh`. Do not edit this file directly. Terraform tracks the state file version (serial) to prevent stale resource states. There are commands to manually change objects in the state in a critical timesensitive production issues.
- **terraform.tfstate.backup:** Backup of the state file, storing the previous version after apply, refresh, or destroy operations. Terraform refers to `lineage` object to identify which resource this statefile is tagged for.

## Commands to access state file objects
Use these commands to manually access objects in the state file. You should not use this unless you have time sensitive production issues.
- `terraform state`: Advance state management using their subcommands.
- `terraform state list`: List resources in the state. 
- `terraform state show <resource_name>`: This command shows the current state of that particular resource. The resource name is an argument to be passed, this is used along with the list command. We can also use grep along with this command to narrow down the list and show `terraform state list | grep github_repository`.

## Hashicorp/Random Provider
Hashicorp has a provider to generate random bytes, id, int, password, pet name, shuffle, string and UUID. This provider acts as a random id generator library which your terraform resources can use. Use byte_length field to declare your length of random id to be generated.

## Splat Expressions
Documentation: `https://developer.hashicorp.com/terraform/language/expressions/splat`
A splat expression provides a more concise way to express a common operation that could otherwise be performed with a for expression.