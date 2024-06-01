terraform {
  backend "s3" {
    bucket = "terraform-smit-1"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}

output "demo" {
  value = "Hello World"
}
