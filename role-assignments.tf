#add your role assignments here
#
#assign reader role for team working on subscription sub-dev
#
resource "azurerm_role_assignment" "sub_pay_as_you_go_reader_01" {
  scope                = data.azurerm_subscription.pay_as_you_go.id
  role_definition_name = "Reader"
  principal_id       = data.azuread_group.engineers.id
}
