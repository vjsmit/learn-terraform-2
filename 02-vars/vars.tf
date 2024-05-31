#variable "sample" {
#  default = 100
#}
#
#variable "sample1" {
#  default = "Hello World"
#}
#
#output "sam" {
#  value = var.sample
#}
#
#output "sam1" {
#  value = var.sample1
#}
#
#output "sam2" {
#  value = "value of sample1 is ${var.sample1}"
#}

variable "course" {
  default = "DevOps"
}

variable "courses" {
  default = [
  "DevOps321",
  "AWS",
  "Python"]
}

variable "courses_details" {
  default = {
    DevOps = {
      name = "DevOps"
      timing = "6 AM"
      duration = 90
    }
    AWS = {
      name = "AWS"
      timing = "8 AM"
      duration = 60
    }
  }
}

output "course" {
  value = var.course
}

output "courses" {
  value = var.courses[1]
}

output "courses_details" {
  value = var.courses_details["AWS"]
}