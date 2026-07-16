output "spring_cloud_services_id" {
  description = "Map of id values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "spring_cloud_services_build_agent_pool_size" {
  description = "Map of build_agent_pool_size values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.build_agent_pool_size if v.build_agent_pool_size != null && length(v.build_agent_pool_size) > 0 }
}
output "spring_cloud_services_config_server_git_setting" {
  description = "Map of config_server_git_setting values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.config_server_git_setting if v.config_server_git_setting != null && length(v.config_server_git_setting) > 0 }
  sensitive   = true
}
output "spring_cloud_services_container_registry" {
  description = "Map of container_registry values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.container_registry if v.container_registry != null && length(v.container_registry) > 0 }
  sensitive   = true
}
output "spring_cloud_services_default_build_service" {
  description = "Map of default_build_service values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.default_build_service if v.default_build_service != null && length(v.default_build_service) > 0 }
}
output "spring_cloud_services_location" {
  description = "Map of location values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.location if v.location != null && length(v.location) > 0 }
}
output "spring_cloud_services_log_stream_public_endpoint_enabled" {
  description = "Map of log_stream_public_endpoint_enabled values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.log_stream_public_endpoint_enabled if v.log_stream_public_endpoint_enabled != null }
}
output "spring_cloud_services_managed_environment_id" {
  description = "Map of managed_environment_id values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.managed_environment_id if v.managed_environment_id != null && length(v.managed_environment_id) > 0 }
}
output "spring_cloud_services_marketplace" {
  description = "Map of marketplace values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.marketplace if v.marketplace != null && length(v.marketplace) > 0 }
}
output "spring_cloud_services_name" {
  description = "Map of name values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.name if v.name != null && length(v.name) > 0 }
}
output "spring_cloud_services_network" {
  description = "Map of network values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.network if v.network != null && length(v.network) > 0 }
}
output "spring_cloud_services_outbound_public_ip_addresses" {
  description = "Map of outbound_public_ip_addresses values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.outbound_public_ip_addresses if v.outbound_public_ip_addresses != null && length(v.outbound_public_ip_addresses) > 0 }
}
output "spring_cloud_services_required_network_traffic_rules" {
  description = "Map of required_network_traffic_rules values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.required_network_traffic_rules if v.required_network_traffic_rules != null && length(v.required_network_traffic_rules) > 0 }
}
output "spring_cloud_services_resource_group_name" {
  description = "Map of resource_group_name values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "spring_cloud_services_service_registry_enabled" {
  description = "Map of service_registry_enabled values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.service_registry_enabled if v.service_registry_enabled != null }
}
output "spring_cloud_services_service_registry_id" {
  description = "Map of service_registry_id values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.service_registry_id if v.service_registry_id != null && length(v.service_registry_id) > 0 }
}
output "spring_cloud_services_sku_name" {
  description = "Map of sku_name values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.sku_name if v.sku_name != null && length(v.sku_name) > 0 }
}
output "spring_cloud_services_sku_tier" {
  description = "Map of sku_tier values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.sku_tier if v.sku_tier != null && length(v.sku_tier) > 0 }
}
output "spring_cloud_services_tags" {
  description = "Map of tags values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "spring_cloud_services_trace" {
  description = "Map of trace values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.trace if v.trace != null && length(v.trace) > 0 }
}
output "spring_cloud_services_zone_redundant" {
  description = "Map of zone_redundant values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.zone_redundant if v.zone_redundant != null }
}

