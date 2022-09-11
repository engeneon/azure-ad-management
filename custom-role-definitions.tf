#Custom roles are discouraged but if you must define them, do it here
#Create custom role for resource lock management
resource "azurerm_role_definition" "core-subscription-lock-management" {
  name  = "custom-core-subscription-source-lock-management"
  scope = data.azurerm_subscription.pay_as_you_go.id

  permissions {
    actions     = ["Microsoft.Authorization/locks/*"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.pay_as_you_go.id
  ]
}
