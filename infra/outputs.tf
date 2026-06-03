# URLs de los Static Web Apps
output "swa_urls" {
  description = "URLs de los Static Web Apps"
  value = {
    for env in var.environments :
    env => azurerm_static_web_app.swa[env].default_host_name
  }
}
 
# API Keys para deploy (necesarios para GitHub Actions)
output "swa_api_keys" {
  description = "API Keys para deploy"
  sensitive   = true
  value = {
    for env in var.environments :
    env => azurerm_static_web_app.swa[env].api_key
  }
}
