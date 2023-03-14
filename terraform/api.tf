 module "rest_api_resource" {
     source                  = "../modules/aws-gateway/api-gateway-private-lambda"
     name                    = "${var.name}" 
     description             = var.description
     policy                  = <<EOF
 {
     "Version": "2012-10-17",
     "Statement": [
         {
             "Effect": "Deny",
             "Principal": "*",
             "Action": "execute-api:Invoke",
             "Resource": "execute-api:/${var.rest_api_stage_name}/*/*",
             "Condition": {
                 "StringNotEquals": {
                     "aws:sourceVpc": "${var.vpc_id}"
                 }
             }
         },
         {
             "Effect": "Allow",
             "Principal": "*",
             "Action": "execute-api:Invoke",
             "Resource": "execute-api:/${var.rest_api_stage_name}/*/*"
         }
     ]
 }
 EOF
     vpc_endpoint_ids        = [data.aws_vpc_endpoint.endpoint.id]
     stage_name              = var.rest_api_stage_name
     stage_description       = var.stage_description 
     path_part               = var.path_part
     method                  = var.http_method
     authorization           = var.authorization
     lambda_arn              = module.lambda_s3.arn
     region                  = var.region
     account_id              = var.account_id
     credentials             = module.role_lambda_s3.arn
 }