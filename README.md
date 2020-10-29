# IBM Sysdig Terraform Module

This is a collection of modules that make it easier to provision a sysdig monitor on IBM Cloud Platform:
* [Sysydig Instance](modules/sysdig_instance)
* [Sysdig Instance Key](modules/sysdig_instance_key)

## Compatibility

This module is meant for use with Terraform 0.12. 

## Usage

Full examples are in the [examples](./examples/) folder, but basic usage is as follows for creation of sysdig instance:

```hcl
provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "sysdig" {
  source = "../../modules/sysdig_instance"

  service_name        = var.service_name
  resource_group_id   = data.ibm_resource_group.sysdig.id
  plan                = var.plan
  region              = var.region
  service_endpoints   = var.service_endpoints
  tags                = var.tags
  parameters          = var.parameters
}

module "sysdig_key" {
  source = "../../modules/sysdig_instance_key"

  resource_key_name       = var.resource_key_name
  resource_instance_id    = module.sysdig.sysdig_instance_id  
  role                    = var.role
  tags                    = var.key_tags
  parameters              = var.key_parameters
}

```

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.12
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 

## Install

### Terraform

Be sure you have the correct Terraform version (0.12), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 
