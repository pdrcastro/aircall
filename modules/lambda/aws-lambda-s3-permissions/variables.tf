variable "source_bucket_arn" {
  description = "ARN of the specific resource within that service to grant permission to"
  default = ""
}

variable "lambda_function_arn" {
  description = "Name of the Lambda function whose resource policy you are updating"
  default = ""
}