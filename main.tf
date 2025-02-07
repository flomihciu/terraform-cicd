provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  #   backend "s3" {
  #   bucket         = "tf-s3-state-32434523544"
  #   key            = "terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "tf_dynmodb_state_lock"
  #   encrypt        = true
  # }
}

resource "aws_s3_bucket" "tf_s3_cicd" {
  bucket = "chandra-tf-cicd-bucket-testing-test-9876"  # Replace with your desired bucket name
  tags = {
    "name" = "tfcicd-bucket",
    "team" = "devops"
    "role" = "sre"
    "company" = "cp"
    "text" = "checking pull request"
  }
}
output "bucket_id" {
  description = "Bucket ID"
  value = aws_s3_bucket.tf_s3_cicd.id
}