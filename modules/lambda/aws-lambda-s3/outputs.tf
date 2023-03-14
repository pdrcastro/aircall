output "arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function"
  value       = aws_lambda_function.lambda.arn
}

output "version" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function"
  value       = aws_lambda_function.lambda.version
}