provider "aws" {
  region = "sa-east-1"
}

module "ec2-instance" {
    source = "../../../../../desenvolvimento/terraform/modules/ec2-instance/"
    vpc_id = "${module.vpc.vpc_id}"
}
module "vpc" {
    source = "../../../../../desenvolvimento/terraform/modules/vpc/"
    #vpc_id = "${module.vpc.vpc_id}"
}