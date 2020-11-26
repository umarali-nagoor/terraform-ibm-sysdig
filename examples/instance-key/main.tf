#####################################################
# Sysdig resource Key attach
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "sysdig_instance" {
  source  = "terraform-ibm-modules/sysdig/ibm//modules/instance"

  service_name        = var.service_name
  resource_group_id   = data.ibm_resource_group.sysdig.id
  plan                = var.plan
  region              = var.region
  service_endpoints   = var.service_endpoints
  tags                = var.tags
  parameters          = var.parameters
}

module "sysdig_instance-key" {
  source  = "terraform-ibm-modules/sysdig/ibm//modules/instance-key"

  resource_key_name       = var.resource_key_name
  resource_instance_id    = module.sysdig.sysdig_instance_id  
  role                    = var.role
  tags                    = var.key_tags
  parameters              = var.key_parameters
}