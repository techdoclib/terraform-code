

/*
ami_type = "AL2_x86_64"
capacity_type = "ON_DEMAND"
disk_size = 20
instance_types = ["t3.micro"]

*/

variable "ami_type" {
  default = "AL2_x86_64"
}
variable "capacity_type" {
  default = "ON_DEMAND"
}
variable "disk_size" {
  default = 25
}
variable "instance_types" {
    default = ["t2.micro"]
}
variable "ec2_ssh_key" {
  default = "eks-terraform-key"
}
variable "desired_size" {
  default = 2
}
variable "min_size" {
  default = 2
}
variable "max_size" {
  default = 2
}
variable "max_unavailable" {
  default = 1
}




