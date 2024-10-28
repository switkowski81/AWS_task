variable "instance_count" {}
variable "ami_id" {}
variable "instance_type" {}

variable "instance_name" {
  description = "Nazwa instancji EC2"
  type        = string
  default     = "default-ec2-instance"  
}
