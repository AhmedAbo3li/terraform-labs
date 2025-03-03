
module "network" {
  source               = "./mymodule"
  vpc_cidr             = var.vpc_cidr
  region               = var.region
  env                  = var.env
  bastion_ingress_cidr = var.bastion_ingress_cidr
  app_ingress_cidr     = var.app_ingress_cidr
  subnets_list         = var.subnets_list

}