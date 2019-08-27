provider "aws" {
region = "${var.region}"
}
resource "aws_instance" "Teste" {
  #key_name = "teste.pem"
  ami = "${var.ami}"
  instance_type = "${var.type}"
  vpc_security_group_ids = ["${aws_security_group.security.id}"]
  associate_public_ip_address = "true"
  #security_groups = ["${aws_security_group.security.id}"]
    
  tags {
    Name = "ci/cd gitlab"
  }
  }
  
resource "aws_security_group" "security" {
    vpc_id = "${var.vpc_id}"
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
