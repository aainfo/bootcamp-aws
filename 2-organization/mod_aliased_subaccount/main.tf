resource "aws_organizations_account" "subaccount" {
  email                      = var.subaccount_email
  iam_user_access_to_billing = "DENY"
  name                       = var.subaccount_name
  role_name                  = var.organization_role_name
}

provider "aws" {
  alias = "subaccount"

  assume_role {
    session_name = var.organization_role_name
    role_arn     = "arn:aws:iam::${aws_organizations_account.subaccount.id}:role/${var.organization_role_name}"
  }
}

resource "aws_iam_account_alias" "subaccount_alias" {
  provider = aws.subaccount
  account_alias = var.subaccount_name
}

resource "null_resource" "order" {
}
