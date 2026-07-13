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
  # --- Unconfirmed validation candidates, derived from azurerm_role_assignment's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: scope
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: role_definition_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: principal_type
  #   condition: contains(["User", "Group", "ServicePrincipal"], value)
  #   message:   must be one of: User, Group, ServicePrincipal
  # path: delegated_managed_identity_resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: delegated_managed_identity_resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: description
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: condition
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: condition_version
  #   condition: contains(["1.0", "2.0"], value)
  #   message:   must be one of: 1.0, 2.0
}

