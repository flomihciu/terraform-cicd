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
}

resource "aws_s3_bucket" "tf_s3_cicd" {
  bucket = "chandra-tf-cicd-bucket-testing-chandra2"  # Replace with your desired bucket name
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