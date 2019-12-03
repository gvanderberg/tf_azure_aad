provider "azuread" {
  version = "=0.7.0"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

provider "random" {
  version = "=2.1.2"
}

# terraform {
#   backend "remote" {
#     hostname     = "app.terraform.io"
#     organization = "titansoft"
#     token        = "__token__"

#     workspaces {
#       # name = "__workspace_name__"
#       prefix = "tf_azure_aad-"
#     }
#   }
# }
