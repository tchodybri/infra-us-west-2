resource "aws_security_group" "admin" {
  name        = format("%s-admin", var.name)
  description = "Administrative access"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name      = format("%s-admin", var.name)
    TEAM      = var.team
    terraform = true
  }
}
resource "aws_security_group_rule" "ssh" {
  description       = "ssh access"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.admin.id
}

resource "aws_security_group_rule" "icmp" {
  description       = "pong!"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.admin.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.admin.id
}

resource "aws_security_group_rule" "http" {
  description       = "http_access"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.admin.id

}