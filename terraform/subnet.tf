resource "aws_subnet" "public" {
  for_each                = toset(var.availability-zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, (20 + index(var.availability-zones, each.value)))
  availability_zone_id    = each.value
  map_public_ip_on_launch = false
  tags = {
    Name      = "${var.name}-public-${each.value}"
    SITE      = var.site
    TEAM      = var.team
    Terraform = "true"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = toset(var.availability-zones)
  subnet_id      = aws_subnet.public[each.value].id
  route_table_id = aws_route_table.public.id
}
