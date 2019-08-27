variable "region" {
    default = "sa-east-1"
    description = "Main region"
}

variable  "ami"{
    default = "ami-0bb96001cf2299257"
}

variable "type"{
    default ="t2.micro" 
}

variable "cidr_block_vpc"{
    default = "10.0.0.0/16"
}

variable "cidr_block_public" {
  default = "10.0.0.0/24"
}
variable "cidr_block_private" {
  default = "10.0.1.0/24"
}
variable "port" {
    default = "80"
}
variable "port_https"{
    default = "443"

}
variable "port_sh"{
    default = "22"
}

variable "i_protocol"{
    default = "tcp"
}
variable "vpc_id" {
    default = ""
}