repo_count = 2

# comment out the line below if using terraform.tfvars - Checkout the variables source precedence in TerraformNotes.md
# varsource  = "terraform.tfvars"

env        = "dev"
repo_names = ["infra", "backend", "backend"] # Duplicate names will be ignored due to the 'set' type in variables.tf