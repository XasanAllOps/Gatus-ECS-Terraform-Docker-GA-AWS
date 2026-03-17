variable "environment" {
  type = string
}

variable "github_repo" {
  type = string
}

variable "github_branch" {
  type = string
  validation {
    condition = contains(["main", "master"], var.github_branch)
    error_message = "Invalid input! You must type the default branch name of your GitHub repository, which is either 'main' or 'master'. Please check your GitHub repository and try again."
  }
}

variable "bucket_name" {
  type = string
}

variable "aws_region" {
  type = string
}