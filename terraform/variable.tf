variable "name" {
  default = "mst"
}
variable "region" {
  default = "us-west-2"
}

variable "team" {
  default = "admin"
}

variable "cidr_block" {
  default = ""
}
variable "ami" {
  default = "ami-012c545587af64585"
}

variable "tenancy" {
  default = "default"
}

variable "availability-zones" {
  default = ["usw2-az1", "usw2-az2"]
}


variable "key_pair_name" {
  default = "lab-key"
}
