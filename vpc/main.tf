terraform {
  cloud {
    organization = "s_tc_1"

    workspaces {
      name = "infra-vpc"
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

resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 

 tags = {
    Name = "Main VPC"
  }
}
