terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.25.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.14.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}