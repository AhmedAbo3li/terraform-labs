region            = "eu-central-1"
vpc_cidr         = "10.1.0.0/16"
availability_zone = "eu-central-1"

subnets_list = [
  {
    name       = "prod-public-subnet-1"
    cidr_block = "10.1.1.0/24"
    type       = "public"
  },
  {
    name       = "prod-private-subnet-1"
    cidr_block = "10.1.2.0/24"
    type       = "private"
  }
]

ami_id               = "ami-0e1bed4f06a3b463d"  
instance_type        = "t2.micro"
bastion_ingress_cidr = "0.0.0.0/0"
app_ingress_cidr     = "10.1.0.0/16"
env                 = "prod"
