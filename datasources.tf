# Get VPC network to use.
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "devopsph-tfstate-default"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}