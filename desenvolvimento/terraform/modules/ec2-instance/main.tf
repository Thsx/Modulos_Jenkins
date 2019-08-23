provider "aws" {
region = "${var.region}"
}
resource "aws_instance" "Teste" {
  ami = "${var.ami}"
  instance_type = "${var.type}"
  ##security_groups = ["${aws_security_group.security.id}"]
  associate_public_ip_address = "true"
    
  tags {
    Name = "ci/cd gitlab"
  }
  }
  resource "aws_vpc" "Teste_Vpc" {
  cidr_block = "${var.cidr_block_vpc}"
}

resource "aws_security_group" "security" {
vpc_id = "${aws_vpc.Teste_Vpc.id}"
  ingress {
    from_port   = "${var.port}"
    to_port     = "${var.port}"
    protocol    = "${var.i_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "${var.port_https}"
    to_port     = "${var.port_https}"
    protocol    = "${var.i_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "${var.port_sh}"
    to_port     = "${var.port_sh}"
    protocol    = "${var.i_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  tags {
    Name = "Security Group Instance"
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
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "route" {

    subnet_id = "${aws_subnet.Public.id}"
    route_table_id = "${aws_route_table.rtb_public.id}"
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.Teste_Vpc.id}"

  tags = {
    Name = "git-gateway"
  }
}
