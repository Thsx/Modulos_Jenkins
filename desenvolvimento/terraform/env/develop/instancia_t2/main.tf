provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
    source = "../../../../../desenvolvimento/terraform/modules/ec2-instance/"
    
}
