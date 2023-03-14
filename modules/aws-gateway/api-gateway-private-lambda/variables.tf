variable "name" {
  description = "The name of the REST API"
}

variable "policy" {
  description = "JSON formatted policy document that controls access to the API Gateway"
}

variable "description" {
  description = "The description of the REST API"
}


variable "vpc_endpoint_ids" {
  description = "A list of VPC Endpoint Ids. It is only supported for PRIVATE endpoint type"
  type        = list(string)
  default     = []
}

variable "stage_name" {
  description = "The name of the stage. If the specified stage already exists, it will be updated to point to the new deployment. If the stage does not exist, a new one will be created and point to this deployment."
}

variable "stage_description" {
  description = "The description of the stage"
}

variable "path_part" {
  description = "The last path segment of this API resource"
}

variable "method" {
  description = "The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY"
}

variable "authorization" {
  description = "Authorization. Default NONE"
}

variable "lambda_arn" {
  description = "Lambda ARN where API Gateway will connect"
}

variable "region" {
  description = "region of API Gateway"
}

variable "account_id" {
  description = "Account ID where RUN aPI Gateway"
}

variable "credentials" {
  description = "The credentials required for the integration. For AWS integrations, 2 options are available. To specify an IAM Role for Amazon API Gateway to assume, use the role's ARN. "
}
