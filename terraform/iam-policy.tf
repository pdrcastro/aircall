module "lambda_resize" {
    source      = "../modules/iam/iam-policy"

    policy_name         = var.lambda_resize_policy
    path                = "/"
    policy_description  = ""
    policy              = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeNetworkInterfaces",
        "ec2:CreateNetworkInterface",
        "ec2:DeleteNetworkInterface",
        "ec2:DescribeInstances",
        "ec2:AttachNetworkInterface"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

module "lambda_resize_s3_access" {
    source      = "../modules/iam/iam-policy"

    policy_name         = var.lambda_resize_s3_policy
    path                = "/"
    policy_description  = ""
    policy              = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
                ${data.template_file.buckets.rendered}
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "logs:*",
            "Resource": "arn:aws:logs:*:*:*"
        }
    ]
}
EOF
}

module "lambda_resize_lambda_access" {
    source              = "../modules/iam/iam-policy"

    policy_name         = var.lambda_resize_lambda_access_policy
    path                = "/"
    policy_description  = ""
    policy              = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:ListFunctions",
                "lambda:ListEventSourceMappings",
                "lambda:ListLayerVersions",
                "lambda:ListLayers",
                "lambda:GetAccountSettings",
                "lambda:CreateEventSourceMapping",
                "lambda:InvokeFunction"
            ],
            "Resource": "${module.lambda_s3.arn}"
        }
    ]
}
EOF
}

module "role_lambdaresize" {
    source      = "../modules/iam/iam-policy-attachment"

    role_name   = module.role_lambda_s3.name
    policy_arn  = module.lambda_resize.arn
}

module "role_lambdaresize_s3" {
    source      = "../modules/iam/iam-policy-attachment"

    role_name   = module.role_lambda_s3.name
    policy_arn  = module.lambda_resize_s3_access.arn
}

module "role_lambda_resize_lambda_access" {
    source      = "../modules/iam/iam-policy-attachment"

    role_name   = module.role_lambda_s3.name
    policy_arn  = module.lambda_resize_lambda_access.arn
}
