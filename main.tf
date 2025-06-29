provider "aws" {
  region = var.region
}

resource "aws_key_pair" "ec2-automation-key" {
    key_name = "ec2-automation"
    public_key = file("ec2-automation.pub")
  
}

resource "aws_default_vpc" "default" {
  
}


resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2-automation-key.key_name
  user_data              = file("user_data.sh")

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name  = "${var.stage}-ec2"
    Stage = var.stage
  }

  
}


resource "aws_security_group" "web_sg" {
  name        = "${var.stage}-sg"
  vpc_id = aws_default_vpc.default.id
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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





