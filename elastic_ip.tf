resource "aws_eip" "jenkins" {
  vpc=true


tags = {
    Name = "jenkins_eip"
  }
}