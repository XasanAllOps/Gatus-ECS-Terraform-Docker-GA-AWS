terraform {
  backend "s3" {
    bucket       = "ecs-gatus-app"
    key          = "ecs/tf.tfstate"
    region       = "eu-west-1"
    encrypt      = true  # -- Explicit
    use_lockfile = true  # -- Native S3 Locking
    # dynamodb_table = "state-lock-gatus"
  }
}