data "template_file" "buckets" {
  template = file("scripts/buckets.tpl")
}

# data "aws_security_group" "endpoint" {
#   name = var.sg_name
# }

# data "aws_vpc_endpoint" "endpoint" {
#   service_name = var.service_name
# }

# # data "aws_api_gateway_rest_api" "gateway" {
# #   name = "${var.name}" 
# # }