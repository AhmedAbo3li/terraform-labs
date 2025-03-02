region            = "us-east-1"
vpc_cidr         = "10.0.0.0/16"
availability_zone = "us-east-1a"

subnets_list = [
  {
    name  = "public-subnet-1"
    cidr_block  = "10.0.1.0/24"   
    type  = "public"
  },
  {
    name  = "private-subnet-1"
    cidr_block  = "10.0.2.0/24"   
    type  = "private"
  }
]

instance_configs = [
  {
    name        = "bastion"
    subnet_name = "public-subnet-1"  
  },
  {
    name        = "app-server"
    subnet_name = "private-subnet-1"  
  }
]


ami_id               = "ami-0e1bed4f06a3b463d"
instance_type        = "t2.micro"
bastion_ingress_cidr = "0.0.0.0/0"
app_ingress_cidr     = "10.0.0.0/16"
env                 = "dev"


db_instance_class = "db.t3.micro"
db_username       = "admin"
db_password       = "password"
redis_node_type   = "cache.t3.micro"
