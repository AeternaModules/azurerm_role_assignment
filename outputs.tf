output "role_assignments_id" {
  description = "Map of id values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "role_assignments_condition" {
  description = "Map of condition values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.condition if v.condition != null && length(v.condition) > 0 }
}
output "role_assignments_condition_version" {
  description = "Map of condition_version values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.condition_version if v.condition_version != null && length(v.condition_version) > 0 }
}
output "role_assignments_delegated_managed_identity_resource_id" {
  description = "Map of delegated_managed_identity_resource_id values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.delegated_managed_identity_resource_id if v.delegated_managed_identity_resource_id != null && length(v.delegated_managed_identity_resource_id) > 0 }
}
output "role_assignments_description" {
  description = "Map of description values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.description if v.description != null && length(v.description) > 0 }
}
output "role_assignments_name" {
  description = "Map of name values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.name if v.name != null && length(v.name) > 0 }
}
output "role_assignments_principal_id" {
  description = "Map of principal_id values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.principal_id if v.principal_id != null && length(v.principal_id) > 0 }
}
output "role_assignments_principal_type" {
  description = "Map of principal_type values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.principal_type if v.principal_type != null && length(v.principal_type) > 0 }
}
output "role_assignments_role_definition_id" {
  description = "Map of role_definition_id values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.role_definition_id if v.role_definition_id != null && length(v.role_definition_id) > 0 }
}
output "role_assignments_role_definition_name" {
  description = "Map of role_definition_name values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.role_definition_name if v.role_definition_name != null && length(v.role_definition_name) > 0 }
}
output "role_assignments_scope" {
  description = "Map of scope values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.scope if v.scope != null && length(v.scope) > 0 }
}
output "role_assignments_skip_service_principal_aad_check" {
  description = "Map of skip_service_principal_aad_check values across all role_assignments, keyed the same as var.role_assignments"
  value       = { for k, v in azurerm_role_assignment.role_assignments : k => v.skip_service_principal_aad_check if v.skip_service_principal_aad_check != null }
}

