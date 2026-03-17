terraform {
  backend "s3" {
    bucket       = "tf-state-gatus-app"
    key          = "dev/ecs/tf.state"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}