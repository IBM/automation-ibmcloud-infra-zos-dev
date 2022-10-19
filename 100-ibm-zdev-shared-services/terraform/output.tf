output "ibm-access-group_resource_group_name" {
  description = "The resource group name"
  value = module.ibm-access-group.resource_group_name
}
output "ibm-access-group_admin_group_name" {
  description = "List of admin access group names"
  value = module.ibm-access-group.admin_group_name
}
output "ibm-access-group_edit_group_name" {
  description = "List of editor access group names"
  value = module.ibm-access-group.edit_group_name
}
output "ibm-access-group_view_group_name" {
  description = "List of viewer access group names"
  value = module.ibm-access-group.view_group_name
}
output "ibm-activity-tracker_id" {
  description = "The id of the provisioned instance."
  value = module.ibm-activity-tracker.id
}
output "ibm-activity-tracker_guid" {
  description = "The id of the provisioned instance."
  value = module.ibm-activity-tracker.guid
}
output "ibm-activity-tracker_name" {
  description = "The name of the provisioned instance."
  value = module.ibm-activity-tracker.name
}
output "ibm-activity-tracker_crn" {
  description = "The id of the provisioned instance"
  value = module.ibm-activity-tracker.crn
}
output "ibm-activity-tracker_location" {
  description = "The location of the provisioned instance"
  value = module.ibm-activity-tracker.location
}
output "ibm-activity-tracker_service" {
  description = "The service name of the key provisioned for the instance"
  value = module.ibm-activity-tracker.service
}
output "ibm-activity-tracker_label" {
  description = "The label for the instance"
  value = module.ibm-activity-tracker.label
}
output "ibm-activity-tracker_sync" {
  description = "Value used to order the provisioning of the instance"
  value = module.ibm-activity-tracker.sync
}
output "at-ibm-activity-tracker_id" {
  description = "The id of the provisioned instance."
  value = module.at-ibm-activity-tracker.id
}
output "at-ibm-activity-tracker_guid" {
  description = "The id of the provisioned instance."
  value = module.at-ibm-activity-tracker.guid
}
output "at-ibm-activity-tracker_name" {
  description = "The name of the provisioned instance."
  value = module.at-ibm-activity-tracker.name
}
output "at-ibm-activity-tracker_crn" {
  description = "The id of the provisioned instance"
  value = module.at-ibm-activity-tracker.crn
}
output "at-ibm-activity-tracker_location" {
  description = "The location of the provisioned instance"
  value = module.at-ibm-activity-tracker.location
}
output "at-ibm-activity-tracker_service" {
  description = "The service name of the key provisioned for the instance"
  value = module.at-ibm-activity-tracker.service
}
output "at-ibm-activity-tracker_label" {
  description = "The label for the instance"
  value = module.at-ibm-activity-tracker.label
}
output "at-ibm-activity-tracker_sync" {
  description = "Value used to order the provisioning of the instance"
  value = module.at-ibm-activity-tracker.sync
}
output "sysdig_id" {
  description = "The id of the provisioned instance."
  value = module.sysdig.id
}
output "sysdig_guid" {
  description = "The id of the provisioned instance."
  value = module.sysdig.guid
}
output "sysdig_name" {
  description = "The name of the provisioned instance."
  value = module.sysdig.name
}
output "sysdig_crn" {
  description = "The id of the provisioned instance"
  value = module.sysdig.crn
}
output "sysdig_location" {
  description = "The location of the provisioned instance"
  value = module.sysdig.location
}
output "sysdig_service" {
  description = "The service name of the provisioned instance"
  value = module.sysdig.service
}
output "sysdig_label" {
  description = "The label for the instance"
  value = module.sysdig.label
}
output "sysdig_key_name" {
  description = "The name of the key provisioned for the Sysdig instance."
  value = module.sysdig.key_name
}
output "sysdig_access_key" {
  description = "The access key for the Sysdig instance."
  value = module.sysdig.access_key
  sensitive = true
}
output "vsi-encrypt-auth_id" {
  description = "The ID of the authorization policy ID"
  value = module.vsi-encrypt-auth.id
}
output "cos-encrypt-auth_id" {
  description = "The ID of the authorization policy ID"
  value = module.cos-encrypt-auth.id
}
output "flow-log-auth_id" {
  description = "The ID of the authorization policy ID"
  value = module.flow-log-auth.id
}
output "vsi-encrypt-auth1_id" {
  description = "The ID of the authorization policy ID"
  value = module.vsi-encrypt-auth1.id
}
output "kube-encrypt-auth_id" {
  description = "The ID of the authorization policy ID"
  value = module.kube-encrypt-auth.id
}
output "vpn-secrets-manager-auth_id" {
  description = "The ID of the authorization policy ID"
  value = module.vpn-secrets-manager-auth.id
}
output "kms_id" {
  description = "The id of the provisioned instance."
  value = module.kms.id
}
output "kms_guid" {
  description = "The id of the provisioned instance."
  value = module.kms.guid
}
output "kms_name" {
  description = "The name of the provisioned instance."
  value = module.kms.name
}
output "kms_crn" {
  description = "The id of the provisioned instance"
  value = module.kms.crn
}
output "kms_location" {
  description = "The location of the provisioned instance"
  value = module.kms.location
}
output "kms_service" {
  description = "The service name of the key provisioned for the instance"
  value = module.kms.service
}
output "kms_label" {
  description = "The label for the instance"
  value = module.kms.label
}
output "kms_type" {
  description = "The type of the resource"
  value = module.kms.type
}
output "kms_public_url" {
  description = "The public endpoint for the resource"
  value = module.kms.public_url
}
output "kms_private_url" {
  description = "The private endpoint for the resource"
  value = module.kms.private_url
}
output "logdna_id" {
  description = "The id of the provisioned instance."
  value = module.logdna.id
}
output "logdna_guid" {
  description = "The id of the provisioned instance."
  value = module.logdna.guid
}
output "logdna_name" {
  description = "The name of the provisioned instance."
  value = module.logdna.name
}
output "logdna_crn" {
  description = "The id of the provisioned instance"
  value = module.logdna.crn
}
output "logdna_location" {
  description = "The location of the provisioned instance"
  value = module.logdna.location
}
output "logdna_service" {
  description = "The service name of the provisioned instance"
  value = module.logdna.service
}
output "logdna_label" {
  description = "The label for the instance"
  value = module.logdna.label
}
output "logdna_key_name" {
  description = "The name of the key provisioned for the LogDNA instance."
  value = module.logdna.key_name
}
output "at_resource_group_name" {
  description = "The name of the resource group"
  value = module.at_resource_group.name
}
output "at_resource_group_id" {
  description = "The id of the resource group"
  value = module.at_resource_group.id
}
output "at_resource_group_group" {
  description = "The resource group object"
  value = module.at_resource_group.group
}
output "at_resource_group_sync" {
  description = "Value used to order the provisioning of the resource group"
  value = module.at_resource_group.sync
}
output "at_resource_group_provision" {
  description = "Flag indicating that the resource group was provisioned by this module"
  value = module.at_resource_group.provision
}
output "at_resource_group_tags" {
  description = "Flag indicating that the resource group was provisioned by this module"
  value = module.at_resource_group.tags
}
output "resource_group_name" {
  description = "The name of the resource group"
  value = module.resource_group.name
}
output "resource_group_id" {
  description = "The id of the resource group"
  value = module.resource_group.id
}
output "resource_group_group" {
  description = "The resource group object"
  value = module.resource_group.group
}
output "resource_group_sync" {
  description = "Value used to order the provisioning of the resource group"
  value = module.resource_group.sync
}
output "resource_group_provision" {
  description = "Flag indicating that the resource group was provisioned by this module"
  value = module.resource_group.provision
}
output "resource_group_tags" {
  description = "Flag indicating that the resource group was provisioned by this module"
  value = module.resource_group.tags
}
output "kms_resource_group_name" {
  description = "The name of the resource group"
  value = module.kms_resource_group.name
}
output "kms_resource_group_id" {
  description = "The id of the resource group"
  value = module.kms_resource_group.id
}
output "kms_resource_group_group" {
  description = "The resource group object"
  value = module.kms_resource_group.group
}
output "kms_resource_group_sync" {
  description = "Value used to order the provisioning of the resource group"
  value = module.kms_resource_group.sync
}
output "kms_resource_group_provision" {
  description = "Flag indicating that the resource group was provisioned by this module"
  value = module.kms_resource_group.provision
}
output "kms_resource_group_tags" {
  description = "Flag indicating that the resource group was provisioned by this module"
  value = module.kms_resource_group.tags
}
output "cos_id" {
  description = "The Object Storage instance id"
  value = module.cos.id
}
output "cos_name" {
  description = "The Object Storage instance name"
  value = module.cos.name
}
output "cos_crn" {
  description = "The crn of the Object Storage instance"
  value = module.cos.crn
}
output "cos_location" {
  description = "The Object Storage instance location"
  value = module.cos.location
}
output "cos_key_name" {
  description = "The name of the credential provisioned for the Object Storage instance"
  value = module.cos.key_name
}
output "cos_key_id" {
  description = "The name of the credential provisioned for the Object Storage instance"
  value = module.cos.key_id
}
output "cos_service" {
  description = "The name of the key provisioned for the Object Storage instance"
  value = module.cos.service
}
output "cos_label" {
  description = "The label used for the Object Storage instance"
  value = module.cos.label
}
output "cos_type" {
  description = "The type of the resource"
  value = module.cos.type
}
output "ibm-secrets-manager_id" {
  description = "The Secrets Manager instance CRN id"
  value = module.ibm-secrets-manager.id
}
output "ibm-secrets-manager_guid" {
  description = "The Secrets Manager instance guid"
  value = module.ibm-secrets-manager.guid
}
output "ibm-secrets-manager_name" {
  description = "The Secrets Manager instance name"
  value = module.ibm-secrets-manager.name
}
output "ibm-secrets-manager_crn" {
  description = "The crn of the Secrets Manager instance"
  value = module.ibm-secrets-manager.crn
}
output "ibm-secrets-manager_location" {
  description = "The Secrets Manager instance location"
  value = module.ibm-secrets-manager.location
}
output "ibm-secrets-manager_service" {
  description = "The name of the service provisioned for the Secrets Manager instance"
  value = module.ibm-secrets-manager.service
}
output "ibm-secrets-manager_plan" {
  description = "The plan of the service provisioned"
  value = module.ibm-secrets-manager.plan
}
