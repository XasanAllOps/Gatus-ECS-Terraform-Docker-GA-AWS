# --- normal variables --- #
variable "environment" {
  type = string
}

variable "github_repo" {
  type = string
  
}

variable "github_branch" {
  type = string

  description = <<EOT
⚠️ HEADS UP: What is the primary branch name of your GitHub repository?
Depending on when you created your repo, it might be 'main' or 'master'.
Please check your GitHub repository and type either 'main' or 'master' below:
EOT

  validation {
    condition = contains(["main", "master"], var.github_branch)
    error_message = "Invalid input! You must type the default branch name of your GitHub repository, which is either 'main' or 'master'. Please check your GitHub repository and try again."
  }
}

# -- output related variables -- #
variable "ecr_repository_arn" {
  type = string
}

variable "bucket_name" {
  type = string
}
