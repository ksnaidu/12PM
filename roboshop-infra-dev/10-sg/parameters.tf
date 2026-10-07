resource "aws_ssm_parameter" "frontend_sg_id" {
    name = "/{var.prjoect}/${var.environment}/frontend_sg_id"
    type = "string"
    value = module.frontend.sg_id
  
}