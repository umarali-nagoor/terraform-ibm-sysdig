#####################################################
# Sysdig Instance
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "sysdig_resource_group" {
  name = var.resource_group
}

module "sysdig_instance" {
  source  = "terraform-ibm-modules/sysdig/ibm//modules/instance"

  service_name        = var.service_name
  resource_group_id   = data.ibm_resource_group.sysdig_resource_group.id
  plan                = var.plan
  region              = var.region
  service_endpoints   = var.service_endpoints
  tags                = var.tags
  parameters          = var.parameters
}