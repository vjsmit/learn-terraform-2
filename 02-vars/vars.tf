variable "sample" {
  default = 100
}

variable "sample1" {
  default = "Hello World"
}

output "sam" {
  value = var.sample
}

output "sam1" {
  value = var.sample1
}

output "sam2" {
  value = value of sample1 is var.sample1
}