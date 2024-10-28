
resource "random_pet" "name" {
  length = 2  # Można dostosować długość generowanej nazwy
}

resource "aws_instance" "ec2_instance" {
  count                      = var.instance_count
  ami                        = var.ami_id
  instance_type              = var.instance_type
  key_name                   = "project_key"
  vpc_security_group_ids     = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  subnet_id                  = var.subnet_id

  tags = {
    Name = "${var.instance_name}-${random_pet.name.id}"
  }
}


resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id  

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
