terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

backend "s3" {
  bucket = "expense-infra-dev-remote-state"
  key = "tf-jenkins-backend-deploy"
  region = "us-east-1"
  dynamodb_table="expense-infra-dev-remote-state-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

