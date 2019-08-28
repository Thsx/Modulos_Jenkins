resource "aws_vpc" "Teste_Vpc" {
  cidr_block = "${var.cidr_block_vpc}"
  
  tags = {
    Name = "Deus_Abencoa"
  }
}
  
  resource "aws_subnet" "Public" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.cidr_block_public}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public"
  }
}
resource "aws_subnet" "Private" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.cidr_block_private}"

  tags = {
    Name = "Private"
  }
}
