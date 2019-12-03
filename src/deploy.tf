module "client" {
  source = "./modules/app"

  name          = var.client_app_name
  is_server_app = false
}

module "server" {
  source = "./modules/app"

  name          = var.server_app_name
  is_server_app = true
}
