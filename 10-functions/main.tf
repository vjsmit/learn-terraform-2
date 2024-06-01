variable "class" {
  default = "DevOps"
}

output "class" {
  value = var.class
}

output "CLASS" {
  value = upper(var.class)
}