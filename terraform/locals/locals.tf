locals {
  final_name = "${var.project}-${var.environment}-${var.componet}" #robsohop-dev-cart
  ec2_tags = merge(
    var.common_tags,
    {
        environment - "dev",
        version = "1.0"
    }
  ) 
}
