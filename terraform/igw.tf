resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = format("%s-igw", var.name)
    TEAM      = var.team
    terraform = "true"
  }
}