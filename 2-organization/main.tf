provider "aws" {}

resource "aws_iam_account_alias" "root_alias" {
  account_alias = "bootcampaws-root"
}

module "dev_account" {
  source = "./mod_aliased_subaccount"

  subaccount_name        = "bootcampaws-dev"
  subaccount_email       = "dev-bootcampaws@laposte.net"
  organization_role_name = "OrganizationAdmin"
}

module "ops_account" {
  source = "./mod_aliased_subaccount"

  subaccount_name        = "bootcampaws-ops"
  subaccount_email       = "ops-bootcampaws@laposte.net"
  organization_role_name = "OrganizationAdmin"
}

data "aws_caller_identity" "current" {}
