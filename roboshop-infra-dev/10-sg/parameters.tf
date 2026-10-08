resource "aws_ssm_parameter" "frontend_sg_id" {
    name = "/{var.prjoect}/${var.environment}/frontend_sg_id"
    type = "string"
    value = module.frontend.sg_id
  
}


resource "aws_ssm_parameter" "bastion_sg_id" {
    name = "/{var.prjoect}/${var.environment}/bastion_sg_id"
    type = "string"
    value = module.bastion.sg_id
  
}