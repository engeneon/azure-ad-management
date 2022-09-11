## Manage Azure AD Users and Groups in Terraform

# Overview

* Code and Configuration to manage Azure AD users and groups as well as RBAC Roles and Role Assignments using IAC paradigm
* Scope: Baseline infrastructure AAD identities required to manage the core landing zone infrastructure

# NOTES

* Tested on Terraform v1.0.4
* azuread version = "2.28.1"
* This is meant for Level-0 foundation deployment and management but can be used for the upper layers
* This does not preclude management of users in AAD via the portal or from an on-prem IDP

# Issue log

* for_each defect: https://github.com/hashicorp/terraform/issues/31765

