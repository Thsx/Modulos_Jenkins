variable "cidr_block_public" {
  default = "10.0.0.0/24"
}
variable "cidr_block_private" {
  default = "10.0.1.0/24"
}
variable "cidr_block_vpc"{
    default = "10.0.0.0/16"
}
variable "vpc_id" {
  default = ""
}