variable "cidr_vpc" {
  description = "CIDR Bloco da VPC"
  default = "192.168.0.0/16"
}
variable "cidr_subnet" {
  description = "Subnet Zona D 1.0/24"
  default = "192.168.1.0/24"
}

variable "availability_zone" {
  description = "Zona de Disponibilidade da SubNet"
  default = "us-west-1a"
}
