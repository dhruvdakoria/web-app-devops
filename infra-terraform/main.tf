# Create VPC infrastructure setup
module "vpc" {
   source = "terraform-aws-modules/vpc/aws"
   name = "wordpress"
   cidr = "10.0.0.0/16"
   azs = ["us-east-1a", "us-east-1b"]
   public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]
   private_subnets = ["10.0.2.0/24", "10.0.3.0/24"]
   intra_subnets = ["10.0.4.0/24", "10.0.5.0/24"]
   database_subnets = ["10.0.6.0/24", "10.0.7.0/24"]
   enable_nat_gateway = true
   enable_dns_hostnames = true
}

# Terraform module which deploys Wordpress on AWS using ECS Fargate for compute, RDS for database and an application load balancer.
module "wordpress" {
   source = "atpoirie/wordpress-ecs/aws"
   ecs_service_subnet_ids = module.vpc.private_subnets
   lb_subnet_ids = module.vpc.public_subnets
   db_subnet_group_subnet_ids = module.vpc.database_subnets
}

# Create CI/CD pipeline (CodePipeline, Codebuild, ECR)
module "cicd_web" {
  source = "./cicd"
  name = "ecommerce"
  region = var.region
  tier = "web"
  cluster = "wordpress_cluster"
  aws_account_id=var.aws_account_id
  github_token = var.github_token
  github_owner = var.github_owner
  github_repo = var.github_repo
  github_branch = var.github_branch
  depends_on = [module.wordpress]
}