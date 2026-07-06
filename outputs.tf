output "role_assignments" {
  description = "All role_assignment resources"
  value       = azurerm_role_assignment.role_assignments
}
output "role_assignments_condition" {
  description = "List of condition values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.condition]
}
output "role_assignments_condition_version" {
  description = "List of condition_version values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.condition_version]
}
output "role_assignments_delegated_managed_identity_resource_id" {
  description = "List of delegated_managed_identity_resource_id values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.delegated_managed_identity_resource_id]
}
output "role_assignments_description" {
  description = "List of description values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.description]
}
output "role_assignments_name" {
  description = "List of name values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.name]
}
output "role_assignments_principal_id" {
  description = "List of principal_id values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.principal_id]
}
output "role_assignments_principal_type" {
  description = "List of principal_type values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.principal_type]
}
output "role_assignments_role_definition_id" {
  description = "List of role_definition_id values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.role_definition_id]
}
output "role_assignments_role_definition_name" {
  description = "List of role_definition_name values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.role_definition_name]
}
output "role_assignments_scope" {
  description = "List of scope values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.scope]
}
output "role_assignments_skip_service_principal_aad_check" {
  description = "List of skip_service_principal_aad_check values across all role_assignments"
  value       = [for k, v in azurerm_role_assignment.role_assignments : v.skip_service_principal_aad_check]
}

