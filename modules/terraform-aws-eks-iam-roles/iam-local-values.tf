# Define Local Values in Terraform
variable "business_divsion" {
  default = "and"
}
variable "environment" {
  default = "prod"
}
locals {

  name = "${var.business_divsion}-${var.environment}"

} 