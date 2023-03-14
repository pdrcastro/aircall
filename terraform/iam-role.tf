data "aws_iam_policy_document" "lambda-role-policy" {
    statement {
      actions = ["sts:AssumeRole"]

      principals {
        type        = "Service"
        identifiers = [
          "lambda.amazonaws.com",
          "apigateway.amazonaws.com",
          "edgelambda.amazonaws.com"
          ]
    }
  }
}


module "role_lambda_s3" {
    source      = "../modules/iam/iam-role"

    role_name           = var.lambda_role_name
    assume_role_policy  = data.aws_iam_policy_document.lambda-role-policy.json
}