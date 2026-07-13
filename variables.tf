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
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
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
        v.container_registry == null || alltrue([for item in v.container_registry : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.container_registry == null || alltrue([for item in v.container_registry : (length(item.password) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.container_registry == null || alltrue([for item in v.container_registry : (length(item.server) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.container_registry == null || alltrue([for item in v.container_registry : (length(item.username) > 0)])
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
        v.config_server_git_setting == null || (v.config_server_git_setting.search_paths == null || (alltrue([for x in v.config_server_git_setting.search_paths : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.config_server_git_setting == null || (v.config_server_git_setting.repository == null || alltrue([for item in v.config_server_git_setting.repository : (length(item.name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.config_server_git_setting == null || (v.config_server_git_setting.repository == null || alltrue([for item in v.config_server_git_setting.repository : (item.pattern == null || (alltrue([for x in item.pattern : length(x) > 0])))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.config_server_git_setting == null || (v.config_server_git_setting.repository == null || alltrue([for item in v.config_server_git_setting.repository : (item.search_paths == null || (alltrue([for x in item.search_paths : length(x) > 0])))]))
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
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.trace == null || (v.trace.sample_rate == null || (v.trace.sample_rate >= 0 && v.trace.sample_rate <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_services : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

