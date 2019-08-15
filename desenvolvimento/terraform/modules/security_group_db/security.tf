resource "aws_security_group" "conexdb" {
  name        = "Conexao_Banco"
  description = "permite conexao banco"

  ingress {
    from_port   = "${var.port}"
    to_port     = "${var.port}"
    protocol    = "${var.protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_db"
  }
}