output "instance_ids" {
  value = [for instance in aws_instance.ec2_instance : instance.id]
}

output "instance_ips" {
  value = [for instance in aws_instance.ec2_instance : instance.public_ip]
}
