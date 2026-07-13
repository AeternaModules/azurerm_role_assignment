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
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

