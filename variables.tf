variable "role_assignments" {
  description = <<EOT
Map of role_assignments, attributes below
Required:
    - principal_id
    - scope
Optional:
    - condition
    - condition_version
    - delegated_managed_identity_resource_id
    - description
    - name
    - principal_type
    - role_definition_id
    - role_definition_name
    - skip_service_principal_aad_check
EOT

  type = map(object({
    principal_id                           = string
    scope                                  = string
    condition                              = optional(string)
    condition_version                      = optional(string)
    delegated_managed_identity_resource_id = optional(string)
    description                            = optional(string)
    name                                   = optional(string)
    principal_type                         = optional(string)
    role_definition_id                     = optional(string)
    role_definition_name                   = optional(string)
    skip_service_principal_aad_check       = optional(bool)
  }))
  validation {
    condition = alltrue([
      for k, v in var.role_assignments : (
        v.name == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.name)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.role_assignments : (
        v.role_definition_name == null || (length(v.role_definition_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.role_assignments : (
        v.principal_type == null || (contains(["User", "Group", "ServicePrincipal"], v.principal_type))
      )
    ])
    error_message = "must be one of: User, Group, ServicePrincipal"
  }
  validation {
    condition = alltrue([
      for k, v in var.role_assignments : (
        v.description == null || (length(v.description) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.role_assignments : (
        v.condition == null || (length(v.condition) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.role_assignments : (
        v.condition_version == null || (contains(["1.0", "2.0"], v.condition_version))
      )
    ])
    error_message = "must be one of: 1.0, 2.0"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_role_assignment's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: scope
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: delegated_managed_identity_resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: delegated_managed_identity_resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
}

