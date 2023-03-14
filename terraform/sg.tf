module "sg_lambda_resize" {
  source = "../modules/ec2/sg"

  sg_name        = var.sg_name
  sg_vpc_id      = var.vpc_id
  sg_description = "Lambda Function Resize Security Group"
}


module "sg_lambda_rule_outbound" {
  source = "../modules/ec2/sg-rule-cidr"

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  sg_id       = module.sg_lambda_resize.sg_id
  description = "Allow Lambda to communicate with Internet"
}

module "sg_lambda_rule_inbound_workernodes" {
  source = "../modules/ec2/sg-rule-cidr"

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "TCP"
  cidr_blocks = var.internet
  sg_id       = module.sg_lambda_resize.sg_id
  description = "Allow internet access"
}

