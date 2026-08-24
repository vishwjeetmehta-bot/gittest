module "resource_group" {
  source = "../../modules/azure_resource_group"
  rgs    = var.rgs
}