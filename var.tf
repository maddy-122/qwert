variable "cidr_block" {
    type = string
    default     = "10.0.0.0/16"
  
}

variable "privates_subnet" {
    type = string
    default = "10.0.1.0/24"
  
}

variable "public_subnets" {
    type = string
    default = "10.0.2.0/24"
  
}