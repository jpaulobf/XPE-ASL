provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instancia_01" {

  ami           = "ami-0569ad5e562433283"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0a9af85a6cf50f347"
  vpc_security_group_ids = [aws_security_group.sg_default.id]

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "instancia-01"
  }
}

resource "aws_security_group" "sg_default" {
  name_prefix = "default-sg-"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Ajuste conforme necessário
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}