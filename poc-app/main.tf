module "app_service" {
  source = "../modules/app_service"
  rgname = var.rgname
}