# resource "random_id" "random_decimal_id" {
#   byte_length = 2
#   count       = var.repo_count
# }

resource "github_repository" "repo" {
  for_each    = var.repo_names
  name        = "terraform-repo-${each.key}"
  description = "My Terraform-managed GitHub repository - ${each.key} environment"
  visibility  = var.env == "prod" ? "public" : "private"
  auto_init   = true
  provisioner "local-exec" {
    command = "gh repo view ${self.name} --web"
  }

}

resource "github_repository_file" "readme" {
  for_each            = var.repo_names
  repository          = github_repository.repo[each.key].name
  file                = "README.md"
  content             = "# Terraform Repository\nThis repository is managed by Terraform.\n This is ${var.env} environment."
  commit_message      = "Add README.md"
  overwrite_on_create = true
  branch              = "main"
}

resource "github_repository_file" "index_html" {
  for_each            = var.repo_names
  repository          = github_repository.repo[each.key].name
  file                = "src/index.html"
  content             = "<h1>Hello Terraform !</h1>\n<p>This repository is managed by Terraform.</p>"
  commit_message      = "Add index.html"
  overwrite_on_create = true
  branch              = "main"
}

# output "repo-names" {
#   value       = github_repository.repo[*].name
#   description = "Repository names created by Terraform"
#   sensitive   = false
# }

output "repo-clone-urls" {
  value       = { for i in github_repository.repo : i.name => i.http_clone_url }
  description = "Repository clone URLs created by Terraform"
  sensitive   = false
}
# Output the variable source
# output "var-source" {
#   value       = var.varsource
#   description = "Source used to define variables"
#   sensitive   = false
# }