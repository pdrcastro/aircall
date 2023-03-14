variable "lambda_function_name" {
  description = "Name of Lambda"
  default = ""
}

variable "s3_bucket" {
  description = "Name of the S3 Bucket, where contain the function Lambda deployment"
  default = ""
}

variable "s3_key" {
  description = "The S3 key of an object containing the function's deployment package"
  default = ""
}

variable "app_version" {
  description = "Version Off lambda to deploy"
  default = ""
}

variable "lambda_function_timeout" {
  description = "The amount of time your Lambda Function has to run in seconds"
  default = ""
}

variable "lambda_function_handler" {
  description = "The function entrypoint in your code."
  default = ""
}

variable "runtime" {
  description = "run time tecnhology used in lambda"
  default = "java11"
}

variable "role_arn" {
  description = "role arn will execute the lambda"
  default = ""
}

variable "environment" {
  description = "environment tag "
  default = ""
}

variable "project" {
  description = "project tag "
  default = ""
}

variable "subnet_ids" {
  description = "A list of subnet IDs associated with the Lambda function"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "A list of security group IDs associated with the Lambda function"
  type        = list(string)
  default     = []
}


variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128"
  default = ""
}

variable "publish" {
  type = string
  default = false
}