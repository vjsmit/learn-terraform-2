resource "aws_instance" "web" {
  for_each = var.instances
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    #Name = var.instances[count.index]
    Name = "Hello"
  }
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

variable "instances" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.micro"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.nano"
    }
  }
}