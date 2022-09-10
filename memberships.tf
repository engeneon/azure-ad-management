#member group memberships here

resource "azuread_group_member" "contracting" {
  for_each         = { for u in azuread_user.users : u.display_name => u if u.department == "Contracting" }
  group_object_id  = azuread_group.contracting.id
  member_object_id = each.value.id
}

resource "azuread_group_member" "managers" {
  for_each         = { for u in azuread_user.users : u.display_name => u if u.job_title == "Manager" }
  group_object_id  = azuread_group.managers.id
  member_object_id = each.value.id
}

resource "azuread_group_member" "engineers" {
  for_each         = { for u in azuread_user.users : u.display_name => u if u.job_title == "Engineer" }
  group_object_id  = azuread_group.engineers.id
  member_object_id = each.value.id
}

