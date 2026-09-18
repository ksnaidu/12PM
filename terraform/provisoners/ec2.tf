resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]

    tags = var.ec2_tags

    provisioner "local-exe {
        command = "echo ${self.private_ip} > invenotry"
        on_failure = continue #ignore errors

    }
}
