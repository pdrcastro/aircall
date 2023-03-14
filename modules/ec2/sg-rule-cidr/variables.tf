variable "type" {
  type        = string
  description = "Security group rule type (ingress/egress"
}

variable "from_port" {
  type        = number
  description = "Security group rule from port"
}

variable "to_port" {
  type        = number
  description = "Security group rule to port"
}

variable "protocol" {
  type        = string
  description = "Security group rule protocol (TCP, UDP, ...)"
}

variable "cidr_blocks" {
  type        = list
  description = "Security group rule CIDR blocks (eg: 162.10.2.0/16)"
}

variable "sg_id" {
  type        = string
  description = "Security group ID where to attach the security group rule"
}

variable "description" {
  type        = string
  description = "Security group rule description"
}