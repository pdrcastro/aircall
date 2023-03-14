resource "aws_cloudwatch_log_group" "loggroup" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

resource "aws_lambda_function" "lambda" {
  s3_bucket     = var.s3_bucket
  s3_key        = "${var.s3_key}/${var.app_version}/${var.lambda_function_name}.zip"
  timeout       = var.lambda_function_timeout
  function_name = var.lambda_function_name
  role          = var.role_arn
  handler       = var.lambda_function_handler
  publish       = var.publish

  memory_size   = var.memory_size

  runtime       = var.runtime

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  tags = {
        Name          = var.lambda_function_name
        Environment   = var.environment
        Project       = var.project
    }

}