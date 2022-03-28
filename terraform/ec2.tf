#This script helps you launch your ec2 instances 
#you can use a simple module or resources

resource "aws_instance" "jenkins-server" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = var.key_pair_name
  volume_size   = "8"
  ebs_optimized = false
}