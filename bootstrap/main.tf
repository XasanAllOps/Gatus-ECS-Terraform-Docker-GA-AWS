module "ecr" {
  source = "./modules/ecr"
  environment = var.environment
}

module "iam" {
  source = "./modules/iam"
  environment = var.environment
  bucket_name = module.s3.bucket_name
  github_repo = var.github_repo
  github_branch = var.github_branch
  ecr_repository_arn = module.ecr.ecr_repository_arn
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
}