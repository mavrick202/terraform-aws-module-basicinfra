provider "aws" {
    access_key = "XXX"
    secret_key = "YYY"
    region = "us-east-1"
}

module "VPC1" {
#source = "github.com/mavrick202/terraform-aws-basicinfra.git"
#source = "./modules"
vpc_cidr = "10.1.0.0/16"
public_subnet1_cidr = "10.1.1.0/24"
public_subnet2_cidr = "10.1.2.0/24"
public_subnet3_cidr = "10.1.3.0/24"
public_subnet4_cidr = "10.1.4.0/24"
vpc_name = "terraform-aws-testing"
IGW_name = "terraform-aws-igw"
public_subnet1_name = "Terraform_Public_Subnet1-testing"
public_subnet2_name = "Terraform_Public_Subnet2-testing"
public_subnet3_name = "Terraform_Public_Subnet3-testing"
public_subnet4_name = "Terraform_Public_Subnet4-testing"
Main_Routing_Table = "Terraform_Main_table-testing"
key_name = "LaptopKey"
}

output "subnet1-public" {
  value = "${module.VPC1.subnet1}"
}
output "subnet2-public" {
  value = "${module.VPC1.subnet2}"
}
output "subnet3-public" {
  value = "${module.VPC1.subnet3}"
}

output "subnet4-public" {
  value = "${module.VPC1.subnet3}"
}

output "sgroup" {
  value = "${module.VPC1.sgroup}"
}



resource "aws_instance" "web-1" {
    ami = "ami-0915e09cc7ceee3ab"
    availability_zone = "us-east-1a"
    instance_type = "t2.nano"
    key_name = "LaptopKey"
    subnet_id = "${module.VPC1.subnet1}"
    vpc_security_group_ids = ["${module.VPC1.sgroup}"]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-1"
        Env = "Prod"
        Owner = "Sree"
    }
}

