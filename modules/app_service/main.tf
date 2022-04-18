resource "azurerm_app_service_plan" "poc_low" {
  name                = "${var.prefix}-${var.location}-low-001"
  location            = var.location
  resource_group_name = var.rgname
  kind                = "app"

  sku {
    capacity = var.sku.capacity
    size     = var.sku.size
    tier     = var.sku.tier
  }

  tags = {
    env = var.env
  }
}

resource "azurerm_windows_web_app" "poc_app" {
  name                    = "${var.prefix}-app-demo-001"
  location                = var.location
  resource_group_name     = var.rgname
  service_plan_id         = azurerm_app_service_plan.poc_low.id
  client_affinity_enabled = true
  https_only              = true

  site_config {
    always_on         = "true"
    use_32_bit_worker = "false"
    http2_enabled     = "true"
    health_check_path = "/health"
    default_documents = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php", "hostingstart.html"]

    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v6.0"
    }
  }

  tags = {
    env = var.env
  }

  lifecycle {
    ignore_changes = [app_settings]
  }
}
