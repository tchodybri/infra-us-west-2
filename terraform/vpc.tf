resource "aws_vpc" "main" {
  cidr_block           = "10.20.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name      = upper(var.name)
    TEAM      = var.team
    terraform = "true"
  }
}

resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.default_route_table_id
  tags = {
    Name      = format("%s-default", var.name)
    TEAM      = var.team
    terraform = "true"
  }
}

resource "aws_route" "default" {
  route_table_id         = aws_default_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = format("%s-public", var.name)
    TEAM      = var.team
    terraform = true
  }
}

resource "aws_route" "public-igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}