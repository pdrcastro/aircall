#########
#DEFAULT#
#########
variable "region" {
  default = "eu-central-1"
}

variable "account_id" {
  default = "888888888"
}

###########
#TAGLAMBDA#
###########
variable "project" {
  default = "Aircall Upload Image"
}

variable "environment" {
  default = "Aircall Dev"
}

#####
#VPC#
#####
variable "vpc_id" {
  default = "vpc-123abc123abc"
}

########
#LAMBDA#
########
variable "lambda_role_name" {
  default = "aircall_lambda_resize"
}

variable "lambda_resize_policy" {
  default = "AircallLambdaResizeVPCAccessPolicy"
}

variable "lambda_resize_lambda_access_policy" {
  default = "AircallLambdaResizeVPCAccessPolicyLambda"
}

variable "lambda_resize_s3_policy" {
  default = "AircallLambdaResizeVPCAccessPolicyS3"
}

variable "lambda_function_name" {
  default = "aircall_resize_image"
}

variable "lambda_bucket" {
  default = "lambda.aircall.com"
}

variable "s3_key" {
  default = "resize/staging"
}

variable "app_version" {
  default = "v1.0.0"
}

variable "runtime" {
  default = "nodejs12.x"
}

variable "memory_size" {
  default = 512
}

variable "source_bucket_arn" {
  default = "arn:aws:s3:::lambda.aircall.com"
}

variable "subnet_ids" {
  default = ["subnet-12ab12ab12", "subnet-13ab13ab13ab", "subnet-14ab14ab14ab"]
}


################
#SECURITY GROUP#
################
variable "sg_name" {
  default = "aircall-lambda-resize-sg"
}

variable "internet" {
  default = ["0.0.0.0/0"]
}


#####
#API#
#####

variable "name" {
  default = "aircall-api-resize"
}

variable "path_part" {
  default = "resize"
}

variable "description" {
  default = "API Gateway Used for Lambda resize upload image"
}

###############
#APIDEPLOYMENT#
###############

variable "rest_api_stage_name" {
  default = "dev"
}

variable "stage_description" {
  default = "Aircall Stage Resize"
}

###########
#APIMETHOD#
###########

variable "http_method" {
  default = "ANY"
}

variable "authorization" {
  default = "NONE"
}


###########
#ENDPOINTS#
###########
variable "service_name" {
  default = "com.amazonaws.eu-central-1.execute-api"
}

variable "vpc_endpoint_type" {
  default = "Interface"
}