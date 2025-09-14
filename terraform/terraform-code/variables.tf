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