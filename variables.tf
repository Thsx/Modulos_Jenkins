variable "region" {
    default = "us-west-1"
    description = "Main region"
}

variable  "ami"{
    default = "ami-056ee704806822732"
}

variable "type"{
    default ="t2.micro" 
}

variable "cidr_block_vpc"{
    default = "10.0.0.0/16"
}

variable "cidr_block_public" {
  default = "10.0.1.0/24"
}
variable "cidr_block_private" {
  default = "10.0.5.0/16"
}
variable "port" {
    default = "80"
}

variable "i_protocol"{
    default = "tcp"
}

variable "e_port"{
    default = "0"
}
variable "e_protocol"{
    default = "-1"
}
variable "e_cidr_block"{
    default = ["0.0.0.0/0"]
}
