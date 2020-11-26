#####################################################
# Sysdig key
# Copyright 2020 IBM
#####################################################

output "sysdig_key_id" {
  description = "The ID of the sysdig key"
  value       = ibm_resource_key.sysdigKey.id 
}
