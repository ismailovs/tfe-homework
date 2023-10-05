terraform {

  cloud {
    organization = "s_tc_1"

    workspaces {
      name = "tfe-workspace-exercise"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.49.1"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  version  = "~>0.49.1"
}

data "tfe_organization" "s" {
  name = "s_tc_1"
}

locals {
  exec_type = "local"
  infra-components = [
    "vpc",
    "subnet",
    "ec2",
  ]
}

resource "tfe_workspace" "test" {
  for_each       = toset(local.infra-components)
  name           = each.key
  organization   = data.tfe_organization.s.name
  execution_mode = local.exec_type
}