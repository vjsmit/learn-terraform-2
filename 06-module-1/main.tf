#module "sample1" {
#  source = "./ec2"
#  name = "sample1"
#}
#
#module "sample2" {
#  source = "./ec2"
#  name = "sample2"
#}
#
#output "public_ip_sample1" {
#  value = module.sample1.public_ip
#}
#
#output "public_ip_sample2" {
#  value = module.sample2.public_ip
#}
#
#output "private_ip_sample1" {
#  value = module.sample1.private_ip
#}
#
#output "private_ip_sample2" {
#  value = module.sample2.private_ip
#}

resource "aws_instance" "sample" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-06455962b48979e39"]
  tags = {
    Name = "sample"
  }

  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }

    inline = [
      "sudo labauto ansible",
      "ansible-pull - i localhost, -U https://github.com/vjsmit/roboshop-ansible-1 roboshop.yml -e env=dev -e role_name=frontend"
    ]
  }
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}
