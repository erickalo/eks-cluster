# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "main" {
  # Requisito.
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  # Requisito do EKS.
  enable_dns_support = true
  # Requisito do EKS.
  enable_dns_hostnames             = true
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  assign_generated_ipv6_cidr_block = false
  # Tags da VPC
  tags = {
    Name = "main"
  }
}
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC id."
  sensitive   = false
}