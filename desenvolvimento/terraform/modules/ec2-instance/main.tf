provider "aws" {
region      = "${var.region}"
}
resource "aws_instance" "Teste" {
  ami = "${var.ami}"
  instance_type = "${var.type}"
  
  user_data = <<-EOF
   #!/bin/bash
   echo "Hello, World" > index.html
   nohup busybox httpd -f -p "${var.port}" &
   EOF

  tags {
    Name = "instanciada"
  }
  }
  resource "aws_vpc" "Teste_Vpc" {
  cidr_block = "${var.cidr_block_vpc}"
}

resource "aws_security_group" "main" {
  name = "coe"
  description = "Teste"
  ingress {
    from_port   = "${var.port}"
    to_port     = "${var.port}"
    protocol    = "${var.i_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "security local"
  }
}
  
  ##resource "aws_subnet" "Public" {
  #vpc_id     = "${aws_vpc.Teste_Vpc.id}"
  #idr_block = "${var.cidr_block_public}"

  #tags = {
   # Name = "Public"
  #}
#}
resource "aws_subnet" "Private" {
  vpc_id     = "${aws_vpc.Teste_Vpc.id}"
  cidr_block = "${var.cidr_block_private}"

  tags = {
    Name = "Private"
  }
}
