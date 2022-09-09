#!/bin/bash
#deployment wrapper for terraform Azure AD Management Module

function terraformInit () {
	terraform init
}

function maskOutMemberships () {
  #this is a workaround for a defect in terraform
  mv memberships.tf memberships.tf.off
}

function maskInMemberships () {
  #this is a workaround for a defect in terraform
  mv memberships.tf.off memberships.tf
}

function terraformPlan() {
	terraform plan -out terraform.plan
}

function loginToTenant() {
 #handle special login requirements for Azure AD management
  az logout
  az login --allow-no-subscriptions
}

function terraformApply() {
	terraform apply terraform.plan
}

function terraformStateList () {
	terraform state list
	az ad user list --query "[?department=='Contracting'].{ department: department, name: displayName, jobTitle: jobTitle, pname: userPrincipalName }" --output tsv
}

#0) authenticate
#loginToTenant

#1) initialise 
#terraformInit

#Part 1 of a 2-Part Hack
maskOutMemberships

#2) terraform plan
terraformPlan

#3) terraform  apply
terraformApply

#4) Show what was done
terraformStateList

#Part 2 of a 2-Part Hack
maskInMemberships

#5) terraform plan
terraformPlan

#6) terraform  apply
terraformApply

#7) clean up ...
#probably just delete the old plans, .terraform dirs etc ...
