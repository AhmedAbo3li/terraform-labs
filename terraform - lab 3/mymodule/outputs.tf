output "subnets" {
  value = aws_subnet.subnets
  sensitive = false
  description = "value of aws_subnet.subnets"
}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
  sensitive = false
  description = "value of aws_security_group.bastion_sg.id"
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
  sensitive = false
  description = "value of aws_security_group.app_sg.id"
}
output "security_groups" {
  value = {
    bastion_sg = aws_security_group.bastion_sg.id
    app_sg     = aws_security_group.app_sg.id
    # rds_sg     = aws_security_group.rds_sg.id
    # redis_sg   = aws_security_group.redis_sg.id
  }
  sensitive = false
  description = "IDs of security groups"
}
