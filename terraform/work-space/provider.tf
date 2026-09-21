terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "12pm-remote-state"
    key    = "workspace-demo"
    region = "us-east-1"
    #dynamodb_table= "12pm-remote-state-lock"
    encrypt       = true
    use_lockfile  = true
  }
}

provider "aws" {
  # Configuration options
}