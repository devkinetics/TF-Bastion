provider "aws" {
  region = "us-east-1"
}

module "bastion" {
  source = "Guimove/bastion/aws"
  bucket_name = aws_s3_bucket.bastion_logs.bucket
  region = "us-east-1"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  is_lb_private = "false" 
  bastion_host_key_pair = "bastion-kp"
  create_dns_record = "false"
  elb_subnets = data.terraform_remote_state.network.outputs.private_subnets
  auto_scaling_group_subnets = data.terraform_remote_state.network.outputs.private_subnets
  tags = {
    name = "bastion",
    description = "TF Bastion"
  }
}