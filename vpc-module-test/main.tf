module "vpc" {
    source = "../terraform-aws-vpc"
    porject = "roboshop"
    environment = "dev"
}

