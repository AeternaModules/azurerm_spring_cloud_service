resource "azurerm_spring_cloud_service" "spring_cloud_services" {
  for_each = var.spring_cloud_services

  location                           = each.value.location
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  build_agent_pool_size              = each.value.build_agent_pool_size
  log_stream_public_endpoint_enabled = each.value.log_stream_public_endpoint_enabled
  managed_environment_id             = each.value.managed_environment_id
  service_registry_enabled           = each.value.service_registry_enabled
  sku_name                           = each.value.sku_name
  sku_tier                           = each.value.sku_tier
  tags                               = each.value.tags
  zone_redundant                     = each.value.zone_redundant

  dynamic "config_server_git_setting" {
    for_each = each.value.config_server_git_setting != null ? [each.value.config_server_git_setting] : []
    content {
      dynamic "http_basic_auth" {
        for_each = config_server_git_setting.value.http_basic_auth != null ? [config_server_git_setting.value.http_basic_auth] : []
        content {
          password = http_basic_auth.value.password
          username = http_basic_auth.value.username
        }
      }
      label = config_server_git_setting.value.label
      dynamic "repository" {
        for_each = config_server_git_setting.value.repository != null ? [config_server_git_setting.value.repository] : []
        content {
          dynamic "http_basic_auth" {
            for_each = repository.value.http_basic_auth != null ? [repository.value.http_basic_auth] : []
            content {
              password = http_basic_auth.value.password
              username = http_basic_auth.value.username
            }
          }
          label        = repository.value.label
          name         = repository.value.name
          pattern      = repository.value.pattern
          search_paths = repository.value.search_paths
          dynamic "ssh_auth" {
            for_each = repository.value.ssh_auth != null ? [repository.value.ssh_auth] : []
            content {
              host_key                         = ssh_auth.value.host_key
              host_key_algorithm               = ssh_auth.value.host_key_algorithm
              private_key                      = ssh_auth.value.private_key
              strict_host_key_checking_enabled = ssh_auth.value.strict_host_key_checking_enabled
            }
          }
          uri = repository.value.uri
        }
      }
      search_paths = config_server_git_setting.value.search_paths
      dynamic "ssh_auth" {
        for_each = config_server_git_setting.value.ssh_auth != null ? [config_server_git_setting.value.ssh_auth] : []
        content {
          host_key                         = ssh_auth.value.host_key
          host_key_algorithm               = ssh_auth.value.host_key_algorithm
          private_key                      = ssh_auth.value.private_key
          strict_host_key_checking_enabled = ssh_auth.value.strict_host_key_checking_enabled
        }
      }
      uri = config_server_git_setting.value.uri
    }
  }

  dynamic "container_registry" {
    for_each = each.value.container_registry != null ? [each.value.container_registry] : []
    content {
      name     = container_registry.value.name
      password = container_registry.value.password
      server   = container_registry.value.server
      username = container_registry.value.username
    }
  }

  dynamic "default_build_service" {
    for_each = each.value.default_build_service != null ? [each.value.default_build_service] : []
    content {
      container_registry_name = default_build_service.value.container_registry_name
    }
  }

  dynamic "marketplace" {
    for_each = each.value.marketplace != null ? [each.value.marketplace] : []
    content {
      plan      = marketplace.value.plan
      product   = marketplace.value.product
      publisher = marketplace.value.publisher
    }
  }

  dynamic "network" {
    for_each = each.value.network != null ? [each.value.network] : []
    content {
      app_network_resource_group             = network.value.app_network_resource_group
      app_subnet_id                          = network.value.app_subnet_id
      cidr_ranges                            = network.value.cidr_ranges
      outbound_type                          = network.value.outbound_type
      read_timeout_seconds                   = network.value.read_timeout_seconds
      service_runtime_network_resource_group = network.value.service_runtime_network_resource_group
      service_runtime_subnet_id              = network.value.service_runtime_subnet_id
    }
  }

  dynamic "trace" {
    for_each = each.value.trace != null ? [each.value.trace] : []
    content {
      connection_string = trace.value.connection_string
      sample_rate       = trace.value.sample_rate
    }
  }
}

