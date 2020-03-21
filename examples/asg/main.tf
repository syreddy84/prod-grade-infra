provider "aws" {
  region = "us-east-1"
}

module "asg" {
  source             = "../../modules/clusters/asg-rolling-deploy"
  cluster_name       = "test-cluster"
  ami                = "ami-07ebfd5b3428b6f4d"
  instance_type      = "t2.micro"
  min_size           = 1
  max_size           = 1
  enable_autoscaling = false

  subnet_ids = data.aws_subnet_ids.default.ids
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id

}