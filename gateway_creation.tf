resource "aws_internet_gateway" "jenkins_gw" {
  vpc_id = aws_vpc.jenkins.id

  tags = {
    Name = "jenkins_gateway"
  }
}