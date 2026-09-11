variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI id of RHEL9"
  
}


variable "instance_type" {
    default = "t3.micro"
  
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name = "roboshop"
    purpose = "varaibles-demo"
  }
}

variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_description" {
    default = "allowing all ports from internt"
  
}

variable "from_port" {
   default = 0  
}

variable "to_port" {
    default = 0
  
}

variable "cidr_blocks" {
    type =  list(string)
    default = ["0.0.0.0/0"]
  
}

variable "sg_tags" {
    default = {
        Name = "allow-all"
    }
  
}

variable "environment" {
    default = "dev"
  
}
