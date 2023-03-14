module "lambda_s3" {
    source                  = "../modules/lambda/aws-lambda-s3"
    lambda_function_name    = var.lambda_function_name
    s3_bucket               = var.lambda_bucket
    s3_key                  = var.s3_key
    app_version             = var.app_version
    lambda_function_timeout = 120
    role_arn                = module.role_lambda_s3.arn
    lambda_function_handler = "index.handler"
    runtime                 = var.runtime
    subnet_ids              = var.subnet_ids
    security_group_ids      = [module.sg_lambda_resize.sg_id]
    memory_size             = var.memory_size

    environment             = var.environment
    project                 = var.project
}



module "lambda_s3_permissions" {
    source                  = "../modules/lambda/aws-lambda-s3-permissions"
    lambda_function_arn     = module.lambda_s3.arn
    source_bucket_arn       = var.source_bucket_arn
}