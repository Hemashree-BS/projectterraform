provider "aws" {
  region     = "ap-south-1"
}


resource "aws_instance" "example-1" {
  ami           = "ami-08ee1453725d19cdb"
  instance_type = "t2.micro"
  key_name      = "wa_vpc"
  count         = "1"
  tags = {
    Name = "task_1"
  }
  security_groups = [aws_security_group.example_sg.name]
  user_data       = file("data.sh")
}


resource "aws_security_group" "example_sg" {

  name = "task"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "task"
  }
}
