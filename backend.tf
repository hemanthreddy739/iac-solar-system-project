terraform {
  backend "s3" {
    bucket        = "tf-backend-for-solar-system-project"
    key           = "StateFiles"
    region        = "ap-south-1"
    use_lockfile  = true      # Enables state locking via S3, not DynamoDB
  }
}
