provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main.id

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

module "ec2" {
  source          = "./modules/ec2"
  instance_count  = var.instance_count
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  instance_name   = var.instance_name
  subnet_id       = aws_subnet.public.id
  vpc_id          = aws_vpc.main.id
  security_group_ids = [aws_security_group.ec2_sg.id]  
}

resource "aws_launch_configuration" "ec2_launch_config" {
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.ec2_sg.id]
  key_name        = "project_key"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ec2_asg" {
  launch_configuration = aws_launch_configuration.ec2_launch_config.id
  min_size             = 1
  max_size             = 5
  desired_capacity     = var.instance_count
  vpc_zone_identifier  = [aws_subnet.public.id]
  health_check_type    = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = var.instance_name
    propagate_at_launch = true
  }
}
