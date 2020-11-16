provider "aws" {}

variable "first_admin_name" {
  type = string
}

resource "aws_iam_user" "first_admin" {
  name = var.first_admin_name
}

resource "aws_iam_user_policy_attachment" "pol_first_admin" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = aws_iam_user.first_admin.name
}
