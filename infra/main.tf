terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
 
provider "azurerm" {
  features {}
}
 
# --- Resource Groups (uno por ambiente) ---
resource "azurerm_resource_group" "rg" {
  for_each = toset(var.environments)
  name     = "rg-${var.project_name}-${each.key}"
  location = var.location
 
  tags = {
    environment = each.key
    project     = var.project_name
    managed_by  = "terraform"
  }
}
 
# --- Static Web Apps (uno por ambiente) ---
resource "azurerm_static_web_app" "swa" {
  for_each            = toset(var.environments)
  name                = "swa-${var.project_name}-${each.key}"
  resource_group_name = azurerm_resource_group.rg[each.key].name
  location            = azurerm_resource_group.rg[each.key].location
  sku_tier            = "Free"
  sku_size            = "Free"
 
  tags = {
    environment = each.key
    project     = var.project_name
  }
}
