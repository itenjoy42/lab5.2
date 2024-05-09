data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-042ede0157c765756"] ###
  }

  owners = ["amazon"] ### secret manager 사용하기
}

data "aws_security_group" "web-sg" {
  filter {
    name   = "tag:Name"
    values = [var.web-sg-name]
  }
}

data "aws_security_group" "app-sg" {
  filter {
    name   = "tag:Name"
    values = [var.app-sg-name]
  }
}

data "aws_subnet" "web-subnet1" {
  filter {
    name   = "tag:Name"
    values = [var.web-subnet-name1]
  }
}

data "aws_subnet" "web-subnet2" {
  filter {
    name   = "tag:Name"
    values = [var.web-subnet-name2]
  }
}

data "aws_subnet" "app-subnet1" {
  filter {
    name   = "tag:Name"
    values = [var.app-subnet-name1]
  }
}

data "aws_subnet" "app-subnet2" {
  filter {
    name   = "tag:Name"
    values = [var.app-subnet-name2]
  }
}

data "aws_lb_target_group" "web-tg" {
  tags = {
    Name = var.web-tg-name
  }
}

data "aws_lb_target_group" "app-tg" {
  tags = {
    Name = var.app-tg-name
  }
}

# data "aws_iam_instance_profile" "instance-profile" {
#   name = var.instance-profile-name
# }