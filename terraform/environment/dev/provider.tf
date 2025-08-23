terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "ecs-gatus-app"
    key            = "ecs/tf.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "state-lock-gatus"
  }
}
