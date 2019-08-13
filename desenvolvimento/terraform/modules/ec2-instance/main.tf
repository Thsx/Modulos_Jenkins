terraform {
  backend "s3" {
    bucket = "thiago-terraform"
    key    = "terraform/terraform.tfstate"
    region = "us-west-1"
    profile = "thi"
  }
}
provider "aws" {
region      = "${var.region}"
profile                 = "thi"
}
resource "aws_instance" "Teste" {
  ami = "${var.ami}"
  instance_type = "${var.type}"
  security_groups = ["${aws_security_group.seg.id}"]
  
  user_data = <<-EOF
   #!/bin/bash
   echo "Hello, World" > index.html
   nohup busybox httpd -f -p "${var.port}" &
   EOF

  tags {
    Name = "Geladeira_Tsunami"
  }
  }
  resource "aws_vpc" "Teste_Vpc" {
  cidr_block = "${var.cidr_block_vpc}"
}

resource "aws_security_group" "seg" {
vpc_id = "${aws_vpc.Teste_Vpc.id}"
  ingress {
    from_port   = "${var.port}"
    to_port     = "${var.port}"
    protocol    = "${var.i_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = "${var.e_port}"
    to_port     = "${var.e_port}"
    protocol    = "${var.i_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Paredao"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.Teste_Vpc.id}"
 }

  
  resource "aws_subnet" "Public" {
  vpc_id     = "${aws_vpc.Teste_Vpc.id}"
  cidr_block = "${var.cidr_block_public}"

  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "Private" {
  vpc_id     = "${aws_vpc.Teste_Vpc.id}"
  cidr_block = "${var.cidr_block_private}"

  tags = {
    Name = "Private"
  }
}
resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.Teste_Vpc.id}"
route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = "${aws_subnet.Public.id}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}
