##VPC  roboshop-dev

resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    enable_dns_hostnames = "true"  ##host-name enable purpose

    tags = merge(
        var.vpc_tags,
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        }
    )


}

##IGW roboshop-dev

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id  ##assocaitaon with vpc

    tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        }
    )
  
}


##create subnets

resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = local.az_names[count.index] ##0 means inclusive, 2 means exclisive
    map_public_ip_on_launch = true  # subnet instances must use public-ip required

   tags = merge(
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
   }  
   )
}


