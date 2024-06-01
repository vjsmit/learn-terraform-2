variable "class" {
  default = "DevOps"
}

output "class" {
  value = var.class
}

output "CLASS" {
  value = upper(var.class)
}

variable "classes" {
  default = {
    devops = {
      name = "devops"
      topics = [ "Jenkins", "Docker" ]
    }
    aws = {
      name = "aws"
      topics = ["ec2","S3"]
    }
  }
}

output "devops_topics" {
  value = var.classes["devops"]["topics"]
}

output "aws" {
  value = lookup(lookup(var.classes, "aws", null), "topics", "NA")
}

variable "fruits" {
  default = ["Apple", "Orange", "Mango"]
}

output "fruits" {
  value = element(var.fruits, 4)
}
