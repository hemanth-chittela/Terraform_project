# creating an instance
provider "aws" {
  region          = var.specific_region
}

resource "aws_instance" "example" {
  ami           = var.ami_type
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id   = aws_subnet.subnet_public.id
  vpc_security_group_ids = [aws_security_group.Security_groups.id]



   tags = {
    Name = "jenkins_instance"
  }

connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    private_key = file("C:/Users/pc/Desktop/Terraform_project/Sample.pem") # Replace with the path to your private key
    host        = self.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update",
      "sudo apt install -y default-jre",
      "sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key",
      "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt-get update",
      "sudo apt-get install -y jenkins",
      ]
    }
  }