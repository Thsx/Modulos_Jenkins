provider "aws" {
  region = "us-west-1"
}

module "vpc" {
    source = "../../../../../desenvolvimento/terraform/modules/vpc/"
    
}