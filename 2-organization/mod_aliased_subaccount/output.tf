output "id" {
  value = aws_organizations_account.subaccount.id
}

output "alias" {
  value = var.subaccount_name
}