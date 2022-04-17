provider "aws" {
  region = "us-east-1"
}

module "bastion" {
  source = "Guimove/bastion/aws"
  bucket_name = "devopsph-bastion-s3"
  region = "us-east-1"
  vpc_id = "vpc-0eb00254af8ab4f41"
  is_lb_private = "false" 
  bastion_host_key_pair = "bastion-kp"
  create_dns_record = "false"
  #hosted_zone_id = "my.hosted.zone.name."
  #bastion_record_name = "bastion.my.hosted.zone.name."
  #bastion_iam_policy_name = "myBastionHostPolicy"
  elb_subnets = [
    "subnet-0d8aadffb9a8f6f8b",
    "subnet-0fdcd3c6a76624aa1"
  ]
  auto_scaling_group_subnets = [
    "subnet-0d8aadffb9a8f6f8b",
    "subnet-0fdcd3c6a76624aa1"
  ]
  tags = {
    name = "bastion",
    description = "demo"
  }
}