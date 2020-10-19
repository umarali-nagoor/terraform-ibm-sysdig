#####################################################
# Sysdig Instance
# Copyright 2020 IBM
#####################################################

output "sysdig_instance_id" {
  description = "The ID of the sysdig instance"
  value       = ibm_resource_instance.sysdig_instance.id  
}