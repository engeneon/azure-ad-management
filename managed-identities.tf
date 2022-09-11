#create custom managed identities here
#create role assignments for the MI in role-assignments.tf
#then associate the role assignment to resource of choice

##Example: Assign a managed identity access to an Azure Keyvault
#resource "azurerm_user_assigned_identity" "level_0" {
#  resource_group_name = azurerm_resource_group.app.name
#  location            = azurerm_resource_group.app.location
#  name                = uaitest
#}
#
## Assign the reader role on the Key vault to the Managed Identity.
#resource "azurerm_role_assignment" "example" {
#  scope                = azurerm_key_vault.example.id
#  role_definition_name = "Reader"
#  principal_id         = azurerm_user_assigned_identity.uai.id
#}
#
##Ensure the identity has access to the Azure Keyvault
#resource "azurerm_key_vault_access_policy" "example" {
#  key_vault_id = azurerm_key_vault.example.id
#  tenant_id    = data.azurerm_client_config.current.tenant_id
#  object_id    = azurerm_user_assigned_identity.uai.id
#  key_permissions = [
#    "Get","List",
#  ]
#  secret_permissions = [
#    "Get","List",
#  ]
#}
#
##One can further assign the managed identity to another resource like load balancer
## User Assigned Managed Identity
## Note: Appgw does not support Identity for the SKU tier Standard. Supported SKU tiers are Standard_v2,WAF_v2.
##add the following block to the Appgw resource definition
#identity {
#  type         = "UserAssigned"
#  identity_ids = [azurerm_user_assigned_identity.uai.id]
#}
