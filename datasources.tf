# Retrieve domain information
data "azuread_domains" "default" {
  only_initial = true
}

#Creating a role assignment for an AD group for access to a given scope
#Step 1" Create a data source for the scope, in this case a subscription: Pay-As-You-Go
data "azurerm_subscription" "pay_as_you_go" {
  subscription_id = "4decbd3a-55d4-453f-a7ad-17327cff8f01"
}

#Step 2: Create a data source for the Azure AD group to assign a role to
data "azuread_group" "engineers" {
  display_name     = "Contracting - Engineers"
  security_enabled = true
}

