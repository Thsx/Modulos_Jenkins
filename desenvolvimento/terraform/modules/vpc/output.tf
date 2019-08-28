output "vpc_id" {
    description = "The id of VPC"
    value = "${aws_vpc.Teste_Vpc.id}"
}

output "subnet_id" {
    description = "The id of Subnet"
    value = "${aws_subnet.Public.id}"
}
