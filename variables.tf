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
}

