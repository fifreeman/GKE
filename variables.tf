variable "project_id" {
  type = string
  description = "The ID of the project where this VPC will be created"
}

variable "network_name" {
  type = string
  description = "The name of the network being created"
}

variable "subnet_name" {
  type = string
  description = "The name of the subnet for the primary range"
}

variable "subnet_ip" {
  type = string
  description = "The IP range for the primary range"
}

variable "subnet_region" {
  type = string
  description = "The region for the primary subnet"
}
