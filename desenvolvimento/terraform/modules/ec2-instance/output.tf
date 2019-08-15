output "public_instance_ip" {
  value = "${aws_instance.Teste.public_ip}"
}
output "public_subnet_id" {
  value = "${aws_subnet.Public.id}"
}