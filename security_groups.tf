# Creating a security group

resource "aws_security_group" "Security_groups" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.jenkins.id

 dynamic "ingress" {
    for_each = var.jenkins_security_groups

    content {
      from_port   = tonumber(ingress.value)  
      to_port     = tonumber(ingress.value)  
      protocol    = "tcp"
      cidr_blocks =  [element(var.default_cidr_blocks,0)]
    }
  }
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks     = [element(var.default_cidr_blocks,0)]
  }

  tags = {
    Name = "jenkins_security_groups"
  }
}
