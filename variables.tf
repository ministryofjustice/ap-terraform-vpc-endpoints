#variable "enable_s3_gateway" {
#  type        = bool
#  description = "enable s3 gateway"
#}

variable "vpc_id" {
  type        = string
  description = "id of the vpc" #
}

variable "s3_routing_table_ids" {
  type        = list(string)
  description = "id of the routing table to use"
}

variable "tags" {
  description = "A map of tags to add to endpoint resources"
  type        = map(string)
  default     = {}
}