output "github_app_role_arn" {
  description = "COPY TO GITHUB SECRETS: The IAM Role ARN for your build.yml pipeline (ECR Push)"
  value       = module.iam.oidc_role_arn
}

output "github_infra_role_arn" {
  description = "COPY TO GITHUB SECRETS: The IAM Role ARN for your Terraform Workflow"
  value       = module.iam.infra_role_arn
}

output "bucket_name" {
  description = "COPY TO BACKEND.TF: The name of the S3 bucket for your Tier-1 Terraform state"
  value       = module.s3.bucket_name
}

output "ecr_repository_url" {
  description = "The URL of your new ECR repository"
  value       = module.ecr.ecr_repository_url
}