variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID of the EC2 instance"
}

variable "instance_type" {
    default = "t3.micro"
    type = string
    description = "Instance size"
}
variable "sg_ids" {
    type = list
}

variable "tags" {
    type = map
}

