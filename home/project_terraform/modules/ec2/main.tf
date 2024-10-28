
resource "random_pet" "name" {
  length = 2  # Można dostosować długość generowanej nazwy
}

resource "aws_instance" "ec2_instance" {
  count                      = var.instance_count
  ami                        = var.ami_id
  instance_type              = var.instance_type
  key_name                   = "project_key"
  vpc_security_group_ids     = var.security_group_ids  # Use the passed-in security group
  associate_public_ip_address = true
  subnet_id                  = var.subnet_id

  tags = {
    Name = "${var.instance_name}-${random_pet.name.id}"
  }
}

