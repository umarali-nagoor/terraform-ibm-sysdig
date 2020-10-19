# Module sysdig resource key 

This module is used to attach a key to sysdig monitor

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "sysdig" {
  source = "../../modules/sysdig_instance"

  service_name        = var.service_name
  resource_group_id   = data.ibm_resource_group.sysdig_resource_group.id
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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs


| Name                  | Description                                                      | Type         | Default | Required |
|-----------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| resource\_key\_name   | A descriptive name used to identify the resource key             | string       | n/a     | yes      |
| role                  | Name of the user role.                                           | string       | n/a     | yes      |
| tags                  | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| parameters            | Arbitrary parameters to create instance                          | map          | n/a     | no       |
| resource\_instance\_id| Sysydig instance ID                                              | string       | n/a     | no       |