data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  availability_zones  = slice(data.aws_availability_zones.available.names, 0, 2)
  environment         = var.environment
}

module "compute" {
  source = "./modules/compute"

  vpc_id               = module.network.vpc_id
  public_subnet_ids     = module.network.public_subnet_ids
  private_subnet_ids    = module.network.private_subnet_ids
  instance_type         = var.instance_type
  desired_capacity      = var.desired_capacity
  min_size              = var.min_size
  max_size              = var.max_size
  environment           = var.environment
}

module "monitoring" {
  source = "./modules/monitoring"

  alb_arn_suffix        = module.compute.alb_arn_suffix
  autoscaling_group_name = module.compute.autoscaling_group_name
  environment           = var.environment
}
