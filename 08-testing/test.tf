resource "aws_instance" "sample" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.small"
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
