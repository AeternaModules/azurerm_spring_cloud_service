output "spring_cloud_services_id" {
  description = "Map of id values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.id }
}
output "spring_cloud_services_build_agent_pool_size" {
  description = "Map of build_agent_pool_size values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.build_agent_pool_size }
}
output "spring_cloud_services_config_server_git_setting" {
  description = "Map of config_server_git_setting values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.config_server_git_setting }
  sensitive   = true
}
output "spring_cloud_services_container_registry" {
  description = "Map of container_registry values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.container_registry }
  sensitive   = true
}
output "spring_cloud_services_default_build_service" {
  description = "Map of default_build_service values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.default_build_service }
}
output "spring_cloud_services_location" {
  description = "Map of location values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.location }
}
output "spring_cloud_services_log_stream_public_endpoint_enabled" {
  description = "Map of log_stream_public_endpoint_enabled values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.log_stream_public_endpoint_enabled }
}
output "spring_cloud_services_managed_environment_id" {
  description = "Map of managed_environment_id values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.managed_environment_id }
}
output "spring_cloud_services_marketplace" {
  description = "Map of marketplace values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.marketplace }
}
output "spring_cloud_services_name" {
  description = "Map of name values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.name }
}
output "spring_cloud_services_network" {
  description = "Map of network values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.network }
}
output "spring_cloud_services_outbound_public_ip_addresses" {
  description = "Map of outbound_public_ip_addresses values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.outbound_public_ip_addresses }
}
output "spring_cloud_services_required_network_traffic_rules" {
  description = "Map of required_network_traffic_rules values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.required_network_traffic_rules }
}
output "spring_cloud_services_resource_group_name" {
  description = "Map of resource_group_name values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.resource_group_name }
}
output "spring_cloud_services_service_registry_enabled" {
  description = "Map of service_registry_enabled values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.service_registry_enabled }
}
output "spring_cloud_services_service_registry_id" {
  description = "Map of service_registry_id values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.service_registry_id }
}
output "spring_cloud_services_sku_name" {
  description = "Map of sku_name values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.sku_name }
}
output "spring_cloud_services_sku_tier" {
  description = "Map of sku_tier values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.sku_tier }
}
output "spring_cloud_services_tags" {
  description = "Map of tags values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.tags }
}
output "spring_cloud_services_trace" {
  description = "Map of trace values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.trace }
}
output "spring_cloud_services_zone_redundant" {
  description = "Map of zone_redundant values across all spring_cloud_services, keyed the same as var.spring_cloud_services"
  value       = { for k, v in azurerm_spring_cloud_service.spring_cloud_services : k => v.zone_redundant }
}

