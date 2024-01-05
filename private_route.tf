# Creating a private route
resource "aws_route_table" "jenkins_private" {
  vpc_id = aws_vpc.jenkins.id

  route {
    cidr_block = element(var.default_cidr_blocks,0)
    gateway_id = aws_nat_gateway.jenkins.id
  }

  tags = {
    Name = "private_jenkins_route"
  }
}
