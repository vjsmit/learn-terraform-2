resource "aws_instance" "web" {
  for_each = var.instances
  ami           = data.aws_ami.example.id
  instance_type = lookup(each.value, "instance_type", "t3.micro")

  tags = {
    Name = each.key
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
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.nano"
    }
  }
}