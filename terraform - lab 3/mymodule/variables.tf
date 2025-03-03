
variable "region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
  default = "dev"
}

variable "bastion_ingress_cidr" {
  description = "CIDR block for SSH access to the bastion host"
  type        = string
}

variable "app_ingress_cidr" {
  description = "CIDR block for the application security group"
  type        = string
}
variable "subnets_list" {
  description = "List of subnets"
  type = list(object({
    name       = string
    cidr_block = string
    type       = string  
    az         = string

    
  }))
}





