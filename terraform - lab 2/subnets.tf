resource "aws_subnet" "subnets" {
  for_each = { for subnet in var.subnets_list : subnet.name => subnet }

  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = {
    Name = each.key
    Type = each.value.type
  }
}


