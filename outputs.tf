output "spring_cloud_services" {
  description = "All spring_cloud_service resources"
  value       = azurerm_spring_cloud_service.spring_cloud_services
  sensitive   = true
}
output "spring_cloud_services_build_agent_pool_size" {
  description = "List of build_agent_pool_size values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.build_agent_pool_size]
}
output "spring_cloud_services_config_server_git_setting" {
  description = "List of config_server_git_setting values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.config_server_git_setting]
  sensitive   = true
}
output "spring_cloud_services_container_registry" {
  description = "List of container_registry values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.container_registry]
  sensitive   = true
}
output "spring_cloud_services_default_build_service" {
  description = "List of default_build_service values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.default_build_service]
}
output "spring_cloud_services_location" {
  description = "List of location values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.location]
}
output "spring_cloud_services_log_stream_public_endpoint_enabled" {
  description = "List of log_stream_public_endpoint_enabled values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.log_stream_public_endpoint_enabled]
}
output "spring_cloud_services_managed_environment_id" {
  description = "List of managed_environment_id values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.managed_environment_id]
}
output "spring_cloud_services_marketplace" {
  description = "List of marketplace values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.marketplace]
}
output "spring_cloud_services_name" {
  description = "List of name values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.name]
}
output "spring_cloud_services_network" {
  description = "List of network values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.network]
}
output "spring_cloud_services_outbound_public_ip_addresses" {
  description = "List of outbound_public_ip_addresses values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.outbound_public_ip_addresses]
}
output "spring_cloud_services_required_network_traffic_rules" {
  description = "List of required_network_traffic_rules values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.required_network_traffic_rules]
}
output "spring_cloud_services_resource_group_name" {
  description = "List of resource_group_name values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.resource_group_name]
}
output "spring_cloud_services_service_registry_enabled" {
  description = "List of service_registry_enabled values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.service_registry_enabled]
}
output "spring_cloud_services_service_registry_id" {
  description = "List of service_registry_id values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.service_registry_id]
}
output "spring_cloud_services_sku_name" {
  description = "List of sku_name values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.sku_name]
}
output "spring_cloud_services_sku_tier" {
  description = "List of sku_tier values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.sku_tier]
}
output "spring_cloud_services_tags" {
  description = "List of tags values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.tags]
}
output "spring_cloud_services_trace" {
  description = "List of trace values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.trace]
}
output "spring_cloud_services_zone_redundant" {
  description = "List of zone_redundant values across all spring_cloud_services"
  value       = [for k, v in azurerm_spring_cloud_service.spring_cloud_services : v.zone_redundant]
}

