  module "frontend" {
    source = "../../terraform-aws-securitygroup"
	  project = var.project
    environment = var.environment

    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    # vpc_id = data.aws_ssm_parameter.vpc_id
    
    vpc_id = local.vpc_id  ##vpc-id stored in ssm parameter after create.
}
  


  module "bastion" {
    # source = "../../terraform-aws-securitygroup"
    source = "git::https://github.com/ksnaidu/12pm.git//terraform-aws-securitygroup?ref=main"

	  project = var.project
    environment = var.environment

    sg_name = var.bastion_sg_name
    sg_description = var.bastion_sg_description
    vpc_id = local.vpc_id
    
  }
    
  ###bastion accepting connections from my laptop

  resource "aws_security_group_rule" "bastion_laptop" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.bastion.sg_id
    
  }

  ## Now bastion host is depends on security group. so the team exports the ids ssm parameter


  ## create sg for backedn-alb
    module "backend_alb" {
    # source = "../../terraform-aws-securitygroup"
    source = "git::https://github.com/ksnaidu/12pm.git//terraform-aws-securitygroup?ref=main"

	  project = var.project
    environment = var.environment

    sg_name = "backend-alb"
    sg_description = "for backend-alb"
    vpc_id = local.vpc_id
    
  }

    resource "aws_security_group_rule" "backend_alb_bastion" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    source_security_group_id = module.bastion.sg_id
    security_group_id = module.backend_alb.sg_id
    
  }

  