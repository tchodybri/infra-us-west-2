resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = format("%s-igw", var.name)
    TEAM      = var.team
    terraform = true
  }
}

#resource "aws_eip" "nat" {
#  vpc = true
#  tags = {
#    Name      = format("%s-nat", var.name)
#    team      = var.team
#    terraform = "true"
#  }
#}
#
#resource "aws_nat_gateway" "default" {
#  allocation_id = aws_eip.nat.id
#  subnet_id     = aws_subnet.public["usw2-az1"].id
#  tags = {
#    Name      = format("%s-ngw", var.name)
#    TEAM      = var.team
#    terraform = "true"
#  }
#}
#resource "aws_eip" "bar" {
#  vpc = true
#
#  instance                  = aws_instance.jenkins-prod.id
#  associate_with_public_ip = "10.0.0.12"
#  depends_on                = [aws_internet_gateway.gw]
#}