variable "name" {
  default = "tdb"
}
variable "region" {
  default = "us-west-2"
}

variable "team" {
  default = "admin"
}

variable "site" {
  default = "tdb"
}

variable "cidr_block" {
  default = "10.20.0.0/16"
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
