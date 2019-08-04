provider "aws" {
  region = "us-west-1"
}

module "ec2-instance" {
    source = "../../../../../desenvolvimento/terraform/modules/ec2-instance/"
    
}