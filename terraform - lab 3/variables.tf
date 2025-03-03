variable "region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}



variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "bastion_ingress_cidr" {
  description = "CIDR block for SSH access to the bastion host"
  type        = string
}

variable "app_ingress_cidr" {
  description = "CIDR block for the application security group"
  type        = string
}

variable "env" {
  description = "Environment"
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

variable "instance_configs" {
  description = "List of EC2 instances with subnet name"
  type = list(object({
    name        = string
    subnet_name = string
  }))
}




