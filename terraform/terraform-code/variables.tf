## Variable Declaration Args 
# ------------------------------------------------------------
#variable "<LABEL>" {
#  type        = <TYPE>
#  default     = <DEFAULT_VALUE>
#  description = "<DESCRIPTION>"
#  sensitive   = <true|false>
#  nullable    = <true|false>
#  ephemeral   = <true|false>

#  validation {
#    condition     = <EXPRESSION>
#    error_message = "<ERROR_MESSAGE>"
#  }
#}
# ------------------------------------------------------------


variable "repo_count" {
  description = "Number of GitHub repositories to create."
  type        = number
  default     = 1
  validation {
    condition     = var.repo_count > 0 && var.repo_count <= 5
    error_message = "repo_count must be between 1 and 5."
  }
}

# Specifies the source used to define variables
variable "varsource" {
  type        = string
  description = "Source used to define variables."
  default     = "variables.tf"
}

variable "env" {
  type        = string
  description = "Deployment environment."
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.env)
    error_message = "env must be one of 'dev', 'staging', or 'prod'."
  }
}

# You cannot use another variable (var.env) to set the default value of a variable (var.repo_visibility). The below code will throw an error "Variables not allowed". 
#variable "repo_visibility" {
#   type        = string
#   description = "Visibility of the GitHub repositories."
#   default     = var.env == "prod" ? "public" : "private"
#   validation {
#     condition     = contains(["private", "public", "internal"], var.repo_visibility)
#     error_message = "repo_visibility must be one of 'private', 'public', or 'internal'."
#   }
# }

variable "repo_names" {
  type        = set(string)
  description = "List of GitHub repository names to create."
  default     = ["infra", "backend"]
  validation {
    condition     = length(var.repo_names) > 0 && length(var.repo_names) <= 8
    error_message = "repo_names list must contain between 1 and 8 names."
  }
}