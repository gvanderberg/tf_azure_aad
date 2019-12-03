locals {
  application_url = format("https://%s", lower(var.name))
}

resource "random_string" "password" {
  count = var.is_server_app ? 1 : 0

  length  = 32
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "azuread_application" "this" {
  name                       = var.name
  homepage                   = local.application_url
  identifier_uris            = [local.application_url]
  reply_urls                 = [local.application_url]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
  depends_on                 = [random_string.password]
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
  depends_on     = [azuread_application.this]
}

resource "azuread_service_principal_password" "this" {
  count = var.is_server_app ? 1 : 0

  end_date             = "2299-12-30T23:00:00Z"
  service_principal_id = azuread_service_principal.this.id
  value                = random_string.password[0].result
  depends_on           = [azuread_service_principal.this]
}
