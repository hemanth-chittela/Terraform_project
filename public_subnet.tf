# Creating a public subnet
resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.jenkins.id
  cidr_block = element(var.cidr_blocks,1)
  map_public_ip_on_launch = element(var.mapping_ip, 1)


  tags = {
    Name = "jenkins_public_subnet"
  }
}