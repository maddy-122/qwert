variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  default     = false
}

