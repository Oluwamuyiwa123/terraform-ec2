terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"         # Your S3 bucket name
    key            = "ec2/terraform.tfstate"              # Path in the bucket
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-table"               # DynamoDB table for state locking
    encrypt        = true
  }
}
