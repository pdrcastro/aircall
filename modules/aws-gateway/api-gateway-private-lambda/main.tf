resource "aws_api_gateway_rest_api" "rest_api" {
  name        = var.name

  policy      = var.policy
  description = var.description

  endpoint_configuration {
    types = ["PRIVATE"]
    vpc_endpoint_ids = var.vpc_endpoint_ids
  }
}


resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id           = aws_api_gateway_rest_api.rest_api.id
  stage_name            = var.stage_name
  stage_description     = var.stage_description

  depends_on  = [aws_api_gateway_integration.request_method_integration, aws_api_gateway_integration_response.response_method_integration]
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = var.path_part
}

resource "aws_api_gateway_method" "request_method" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = var.method
  authorization = var.authorization
}

resource "aws_api_gateway_integration" "request_method_integration" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.request_method.http_method
  type        = "AWS_PROXY"
  uri         = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_arn}/invocations"

  # AWS lambda can only be invoked with the POST method. BE ATTENTION in the FUTURE
  credentials  = var.credentials
  integration_http_method = "POST"
}

resource "aws_api_gateway_method_response" "response_method" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_integration.request_method_integration.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "response_method_integration" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method_response.response_method.http_method
  status_code = aws_api_gateway_method_response.response_method.status_code

  response_templates = {
    "application/json" = ""
  }
}

resource "aws_lambda_permission" "allow_api_gateway" {
  function_name = var.lambda_arn
  statement_id  = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${aws_api_gateway_rest_api.rest_api.id}/*/${var.method}${aws_api_gateway_resource.proxy.path}"
  depends_on    = [aws_api_gateway_rest_api.rest_api, aws_api_gateway_resource.proxy]
}
