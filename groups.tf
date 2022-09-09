#manage groups here
#create groups and assign users to them based on their attributes.

resource "azuread_group" "contracting" {
  display_name     = "Contracting Department"
  security_enabled = true
}

resource "azuread_group" "managers" {
  display_name     = "Contracting - Managers"
  security_enabled = true
}

resource "azuread_group" "engineers" {
  display_name     = "Contracting - Engineers"
  security_enabled = true
}

