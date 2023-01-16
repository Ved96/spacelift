provider "aws" {
  region  = var.region
}
resource "aws_security_group" "JenkinsSG" {
  name = "Jenkins SG"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#
resource "aws_instance" "JenkinsEC2" {
  instance_type          = var.instance_type
  ami                    = "ami-04902260ca3d33422"
  vpc_security_group_ids = [aws_security_group.JenkinsSG.id]
  key_name               = var.ssh_key_name

  tags = {
    Name = "terraform-jenkins-master"
  }
  user_data = file("userdata.sh")

}

# resource "aws_instance" "ApacheEC2" {
#   instance_type          = var.instance_type
#   ami                    = "ami-04902260ca3d33422"
#   vpc_security_group_ids = [aws_security_group.JenkinsSG.id]
#   key_name               = var.ssh_key_name
#
#   tags = {
#     Name = "Apache-terraform"
#   }
#   user_data = file("userdata1.sh")
#
# }
