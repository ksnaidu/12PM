variable "project" {
    default = "robsohop"
  
}

variable "environment" {
    default = "dev"
  
}

variable "componet" {
    default = "cart"
  
}

variable "common_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
  
}

