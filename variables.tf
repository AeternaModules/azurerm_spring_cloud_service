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
    sku_name                           = optional(string)
    sku_tier                           = optional(string)
    tags                               = optional(map(string))
    zone_redundant                     = optional(bool)
    config_server_git_setting = optional(object({
      http_basic_auth = optional(object({
        password = string
        username = string
      }))
      label = optional(string)
      repository = optional(list(object({
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
          strict_host_key_checking_enabled = optional(bool)
        }))
        uri = string
      })))
      search_paths = optional(list(string))
      ssh_auth = optional(object({
        host_key                         = optional(string)
        host_key_algorithm               = optional(string)
        private_key                      = string
        strict_host_key_checking_enabled = optional(bool)
      }))
      uri = string
    }))
    container_registry = optional(list(object({
      name     = string
      password = string
      server   = string
      username = string
    })))
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
      outbound_type                          = optional(string)
      read_timeout_seconds                   = optional(number)
      service_runtime_network_resource_group = optional(string)
      service_runtime_subnet_id              = string
    }))
    trace = optional(object({
      connection_string = optional(string)
      sample_rate       = optional(number)
    }))
  }))
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
  # path: sku_name
  #   condition: contains(["B0", "S0", "E0"], value)
  #   message:   must be one of: B0, S0, E0
  # path: sku_tier
  #   condition: contains(["Basic", "Enterprise", "Standard", "StandardGen2"], value)
  #   message:   must be one of: Basic, Enterprise, Standard, StandardGen2
  # path: managed_environment_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: managed_environment_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: build_agent_pool_size
  #   condition: contains(["S1", "S2", "S3", "S4", "S5"], value)
  #   message:   must be one of: S1, S2, S3, S4, S5
  # path: container_registry.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container_registry.password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container_registry.server
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container_registry.username
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: default_build_service.container_registry_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: marketplace.plan
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: marketplace.publisher
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: marketplace.product
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: network.app_subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: network.app_subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: network.service_runtime_subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: network.service_runtime_subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: network.outbound_type
  #   condition: contains(["loadBalancer", "userDefinedRouting"], value)
  #   message:   must be one of: loadBalancer, userDefinedRouting
  # path: network.read_timeout_seconds
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: config_server_git_setting.uri
  #   source:    [from validate.ConfigServerURI] !ok
  # path: config_server_git_setting.uri
  #   source:    [from validate.ConfigServerURI] !strings.HasPrefix(v, "http://") && !strings.HasPrefix(v, "https://") && !strings.HasPrefix(v, "git@") && !strings.HasPrefix(v, "ssh://")
  # path: config_server_git_setting.search_paths[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: config_server_git_setting.repository.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: config_server_git_setting.repository.uri
  #   source:    [from validate.ConfigServerURI] !ok
  # path: config_server_git_setting.repository.uri
  #   source:    [from validate.ConfigServerURI] !strings.HasPrefix(v, "http://") && !strings.HasPrefix(v, "https://") && !strings.HasPrefix(v, "git@") && !strings.HasPrefix(v, "ssh://")
  # path: config_server_git_setting.repository.pattern[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: config_server_git_setting.repository.search_paths[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: trace.connection_string
  #   condition: length(value) > 0
  #   message:   must not be empty
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

