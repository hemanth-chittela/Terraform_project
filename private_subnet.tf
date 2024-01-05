
# Creating a private subnet
resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.jenkins.id
  cidr_block = element(var.cidr_blocks,2)
  map_public_ip_on_launch = element(var.mapping_ip, 0)
  tags = {
    Name = "jenkins_private_subnet"
  }
}