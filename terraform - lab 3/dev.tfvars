region            = "us-east-1"
vpc_cidr          = "10.0.0.0/16"
availability_zone = "us-east-1a"

subnets_list = [
  {
    name       = "public-subnet-1"
    cidr_block = "10.0.1.0/24"
    type       = "public"
    az         = "us-east-1a"

  },
  {
    name       = "public-subnet-2"
    cidr_block = "10.0.2.0/24"
    type       = "public"
    az         = "us-east-1a"

  },
  {
    name       = "private-subnet-1"
    cidr_block = "10.0.3.0/24"
    type       = "private"
    az         = "us-east-1a"

  },
  {
    name       = "private-subnet-2"
    cidr_block = "10.0.4.0/24"
    type       = "private"
    az         = "us-east-1b"

  }
]


instance_configs = [
  {
    name        = "web-server-1"
    subnet_name = "public-subnet-1"
  },
  {
    name        = "web-server-2"
    subnet_name = "public-subnet-2"
  },
  {
    name        = "app-server-1"
    subnet_name = "private-subnet-1"
  },
  {
    name        = "app-server-2"
    subnet_name = "private-subnet-2"
  }
]



ami_id               = "ami-0e1bed4f06a3b463d"
instance_type        = "t2.micro"
bastion_ingress_cidr = "0.0.0.0/0"
app_ingress_cidr     = "10.0.0.0/16"
env                  = "dev"


