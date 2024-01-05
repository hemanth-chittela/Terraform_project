# Creating a public route
resource "aws_route_table" "jenkins_public" {
  vpc_id = aws_vpc.jenkins.id

  route {
    cidr_block = element(var.default_cidr_blocks,0)
    gateway_id = aws_internet_gateway.jenkins_gw.id
  }

  tags = {
    Name = "public_jenkins_route"
  }
}
