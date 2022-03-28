terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = "~> 2.0"
  }

  backend "s3" {
    bucket = "terraformstatelab"
    region = "us-west-2"
    key    = "lab/us-west-2/vpc.tf"
  }
}
