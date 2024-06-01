module "frontend" {
  source = "./ec2-1"
  name = "frontend"
}
module "mongodb" {
  source = "./ec2-1"
  name = "mongodb"
}

module "catalogue" {
  source = "./ec2-1"
  name = "catalogue"
}

module "redis" {
  source = "./ec2-1"
  name = "redis"
}

module "user" {
  source = "./ec2-1"
  name = "user"
}

module "cart" {
  source = "./ec2-1"
  name = "cart"
}

module "mysql" {
  source = "./ec2-1"
  name = "mysql"
}

module "shipping" {
  source = "./ec2-1"
  name = "shipping"
}

module "rabbitmq" {
  source = "./ec2-1"
  name = "rabbitmq"
}

module "payment" {
  source = "./ec2-1"
  name = "payment"
}