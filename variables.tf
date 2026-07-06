variable "spring_cloud_services" {
  description = <<EOT
Map of spring_cloud_services, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - build_agent_pool_size
    - log_stream_public_endpoint_enabled
    - managed_environment_id
    - service_registry_enabled
    - sku_name
    - sku_tier
    - tags
    - zone_redundant
    - config_server_git_setting (block):
        - http_basic_auth (optional, block):
            - password (required)
            - username (required)
        - label (optional)
        - repository (optional, block):
            - http_basic_auth (optional, block):
                - password (required)
                - username (required)
            - label (optional)
            - name (required)
            - pattern (optional)
            - search_paths (optional)
            - ssh_auth (optional, block):
                - host_key (optional)
                - host_key_algorithm (optional)
                - private_key (required)
                - strict_host_key_checking_enabled (optional)
            - uri (required)
        - search_paths (optional)
        - ssh_auth (optional, block):
            - host_key (optional)
            - host_key_algorithm (optional)
            - private_key (required)
            - strict_host_key_checking_enabled (optional)
        - uri (required)
    - container_registry (block):
        - name (required)
        - password (required)
        - server (required)
        - username (required)
    - default_build_service (block):
        - container_registry_name (optional)
    - marketplace (block):
        - plan (required)
        - product (required)
        - publisher (required)
    - network (block):
        - app_network_resource_group (optional)
        - app_subnet_id (required)
        - cidr_ranges (required)
        - outbound_type (optional)
        - read_timeout_seconds (optional)
        - service_runtime_network_resource_group (optional)
        - service_runtime_subnet_id (required)
    - trace (block):
        - connection_string (optional)
        - sample_rate (optional)
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    build_agent_pool_size              = optional(string)
    log_stream_public_endpoint_enabled = optional(bool)
    managed_environment_id             = optional(string)
    service_registry_enabled           = optional(bool)
    sku_name                           = optional(string) # Default: "S0"
    sku_tier                           = optional(string)
    tags                               = optional(map(string))
    zone_redundant                     = optional(bool) # Default: false
    config_server_git_setting = optional(object({
      http_basic_auth = optional(object({
        password = string
        username = string
      }))
      label = optional(string)
      repository = optional(object({
        http_basic_auth = optional(object({
          password = string
          username = string
        }))
        label        = optional(string)
        name         = string
        pattern      = optional(list(string))
        search_paths = optional(list(string))
        ssh_auth = optional(object({
          host_key                         = optional(string)
          host_key_algorithm               = optional(string)
          private_key                      = string
          strict_host_key_checking_enabled = optional(bool) # Default: true
        }))
        uri = string
      }))
      search_paths = optional(list(string))
      ssh_auth = optional(object({
        host_key                         = optional(string)
        host_key_algorithm               = optional(string)
        private_key                      = string
        strict_host_key_checking_enabled = optional(bool) # Default: true
      }))
      uri = string
    }))
    container_registry = optional(object({
      name     = string
      password = string
      server   = string
      username = string
    }))
    default_build_service = optional(object({
      container_registry_name = optional(string)
    }))
    marketplace = optional(object({
      plan      = string
      product   = string
      publisher = string
    }))
    network = optional(object({
      app_network_resource_group             = optional(string)
      app_subnet_id                          = string
      cidr_ranges                            = list(string)
      outbound_type                          = optional(string) # Default: "loadBalancer"
      read_timeout_seconds                   = optional(number)
      service_runtime_network_resource_group = optional(string)
      service_runtime_subnet_id              = string
    }))
    trace = optional(object({
      connection_string = optional(string)
      sample_rate       = optional(number) # Default: 10
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.sku_name == null || (contains(["B0", "S0", "E0"], v.sku_name))
      )
    ])
    error_message = "must be one of: B0, S0, E0"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.sku_tier == null || (contains(["Basic", "Enterprise", "Standard", "StandardGen2"], v.sku_tier))
      )
    ])
    error_message = "must be one of: Basic, Enterprise, Standard, StandardGen2"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.build_agent_pool_size == null || (contains(["S1", "S2", "S3", "S4", "S5"], v.build_agent_pool_size))
      )
    ])
    error_message = "must be one of: S1, S2, S3, S4, S5"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.container_registry == null || (length(v.container_registry.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.container_registry == null || (length(v.container_registry.password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.container_registry == null || (length(v.container_registry.server) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.container_registry == null || (length(v.container_registry.username) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.default_build_service == null || (v.default_build_service.container_registry_name == null || (length(v.default_build_service.container_registry_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.marketplace == null || (length(v.marketplace.plan) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.marketplace == null || (length(v.marketplace.publisher) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.marketplace == null || (length(v.marketplace.product) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.network == null || (v.network.outbound_type == null || (contains(["loadBalancer", "userDefinedRouting"], v.network.outbound_type)))
      )
    ])
    error_message = "must be one of: loadBalancer, userDefinedRouting"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.network == null || (v.network.read_timeout_seconds == null || (v.network.read_timeout_seconds >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.config_server_git_setting == null || (v.config_server_git_setting.search_paths == null || (length(v.config_server_git_setting.search_paths) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.config_server_git_setting == null || (v.config_server_git_setting.repository == null || (length(v.config_server_git_setting.repository.name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.config_server_git_setting == null || (v.config_server_git_setting.repository == null || (v.config_server_git_setting.repository.pattern == null || (length(v.config_server_git_setting.repository.pattern) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.config_server_git_setting == null || (v.config_server_git_setting.repository == null || (v.config_server_git_setting.repository.search_paths == null || (length(v.config_server_git_setting.repository.search_paths) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.trace == null || (v.trace.connection_string == null || (length(v.trace.connection_string) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_spring_cloud_service's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.SpringCloudServiceName] !ok
  # path: name
  #   source:    [from validate.SpringCloudServiceName] !regexp.MustCompile(`^([a-z])([a-z\d-]{2,30})([a-z\d])$`).MatchString(v)
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: managed_environment_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: managed_environment_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: network.app_subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: network.app_subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: network.service_runtime_subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: network.service_runtime_subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: config_server_git_setting.uri
  #   source:    [from validate.ConfigServerURI] !ok
  # path: config_server_git_setting.uri
  #   source:    [from validate.ConfigServerURI] !strings.HasPrefix(v, "http://") && !strings.HasPrefix(v, "https://") && !strings.HasPrefix(v, "git@") && !strings.HasPrefix(v, "ssh://")
  # path: config_server_git_setting.repository.uri
  #   source:    [from validate.ConfigServerURI] !ok
  # path: config_server_git_setting.repository.uri
  #   source:    [from validate.ConfigServerURI] !strings.HasPrefix(v, "http://") && !strings.HasPrefix(v, "https://") && !strings.HasPrefix(v, "git@") && !strings.HasPrefix(v, "ssh://")
  # path: trace.sample_rate
  #   source:    validation.FloatBetween(...) - no translation rule yet, add one
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

