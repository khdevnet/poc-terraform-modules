output "url" {
  value = "https://${azurerm_windows_web_app.poc_app.default_hostname}"
}