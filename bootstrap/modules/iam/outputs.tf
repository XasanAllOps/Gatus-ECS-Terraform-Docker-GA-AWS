output "oidc_role_arn" {
  description = "COPY TO GITHUB SECRETS: The IAM role ARN used by the GitHub workflow to push images to ECR"
  value       = aws_iam_role.oidc_role.arn
}

output "infra_role_arn" {
  description = "COPY TO GITHUB SECRETS: The IAM role ARN used by the GitHub workflow to manage infrastructure"
  value       = aws_iam_role.infra_role.arn
}