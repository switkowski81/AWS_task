variable "instance_count" {}
variable "ami_id" {}
variable "instance_type" {}

variable "instance_name" {
  description = "Nazwa instancji EC2"
  type        = string
  default     = "default-ec2-instance"  
}

variable "subnet_id" {
  description = "ID podsieci, do której zostaną przypisane instancje EC2"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the EC2 instances"
  type        = list(string)
}
