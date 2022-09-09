#!/bin/bash
#handle special login requirements for Azure AD management

az logout
az login --allow-no-subscriptions
