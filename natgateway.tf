# Creation of natgateway
resource "aws_nat_gateway" "jenkins" {
  allocation_id = aws_eip.jenkins.id
  subnet_id     = aws_subnet.subnet_public.id

  tags = {
    Name = "natgateway_jenkins"
  }

  depends_on = [aws_internet_gateway.jenkins_gw]
}