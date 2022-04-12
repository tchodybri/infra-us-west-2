#This script helps you launch your ec2 instances 
#you can use a simple module or resources

resource "aws_instance" "jenkins-server" {
  ami           = var.ami
  instance_type = "t2.micro"
  root_block_device {
    volume_type = "gp2"
    volume_size = "8"
  }
  key_name      = var.key_pair_name
  ebs_optimized = false
}