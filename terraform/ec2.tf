#This script helps you launch your ec2 instances in AWS 
#you can use a simple module or resources

resource "aws_instance" "jenkins-server" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public["usw2-az1"].id
  vpc_security_group_ids = [aws_security_group.admin.id]
  root_block_device {
    delete_on_termination = true
    volume_type           = "gp2"
    volume_size           = "8"
  }
  key_name      = var.key_pair_name
  ebs_optimized = false
  tags = {
    Name      = "jenkins-prod"
    TEAM      = var.team
    terraform = true

  }
}
