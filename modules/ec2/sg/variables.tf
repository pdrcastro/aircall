variable "sg_name" {
  description = "SG name"
}

variable "sg_vpc_id" {
  description = "SG VPC ID"
}

variable "sg_description" {
  description = "SG description"
}

variable "tags" {
  type        = map
  default     = {}
  description = "A map of tags to assign to the resource."
}