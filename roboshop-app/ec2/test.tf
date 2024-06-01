resource "aws_instance" "sample" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = var.name
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.sample.public_ip
    }

    inline = [
      "sudo labauto ansible",
      "ansible-pull - i localhost, -U https://github.com/vjsmit/roboshop-ansible-3 main.yml -e env=dev -e role_name=${var.name}"
    ]
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z0094122YFYN2KXK69C5"
  name    = "${var.name}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.sample.private_ip]
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

variable "name" {}

