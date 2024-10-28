variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-06b21ccaeff8cd686"  # AMI ID dla t2.micro w us-east-1
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "The number of EC2 instances to launch"
  type        = number
  default     = 1
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "public_key_path" {
  description = "Path to the public SSH key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Nazwa klucza SSH do EC2"
  type        = string
  default     = "project_key"  # Upewnij się, że klucz istnieje w AWS
}
