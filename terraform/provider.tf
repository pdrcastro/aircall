provider "aws" {
  profile = "dev-terraform"
  region = var.region
}


terraform {
  required_version = "= 0.13.1"
  backend "s3" {
    bucket = "aircall-dev-terraform"
    key = "lambda/resize_image/test/terraform.state"
    region = "eu-central-1"
    encrypt = true
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}