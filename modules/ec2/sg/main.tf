resource "aws_security_group" "sg" {
  name        = var.sg_name
  vpc_id      = var.sg_vpc_id
  description = var.sg_description

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags

}