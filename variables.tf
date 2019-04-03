variable "access_key" {}
variable "secret_key" {}

variable "subnet" {
  type    = "list"
  default = []
}

variable "dcname" {
  type    = "map"
  default = {}
}

variable "instance_type" {}
variable "key_name" {}
variable "client_count" {}
variable "server_count" {}

variable "dc_net" {
  type = "map"

  default = {
    dc1 = "16"
    dc2 = "32"
  }
}

variable "region" {
  default = "us-east-1"
}

variable "create" {
  description = "Create Module, defaults to true."
  default     = true
}

variable "name" {
  description = "Name for resources, defaults to \"consul-auto-join-instance-role-aws\"."
  default     = "consul-auto-join-aws"
}
