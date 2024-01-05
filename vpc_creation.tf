# creating a VPC
resource "aws_vpc" "jenkins" {
  cidr_block       = element(var.cidr_blocks, 0)
  instance_tenancy = "default"
  enable_dns_hostnames = element(var.hostnames, 0)
  tags = {
    Name = "jenkins_vpc"
  }
}