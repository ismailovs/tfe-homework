terraform {
  cloud {
    organization = "s_tc_1"

    workspaces {
      name = "infra-subnet"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
variable "vpc_id" {
  default = "vpc-00c9660b4dd122068"
}

data "aws_vpc" "main" {
  id = var.vpc_id
}

resource "aws_subnet" "example" {
  vpc_id     = data.aws_vpc.main.id
  cidr_block = cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)

  tags = {
    Name = "Main Subnet"
  }
}