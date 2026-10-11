output "datastream_connection_profiles_id" {
  description = "Map of id values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no id are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.id if v.id != null && length(v.id) > 0 }
}
output "datastream_connection_profiles_bigquery_profile" {
  description = "Map of bigquery_profile values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no bigquery_profile are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.bigquery_profile) if v.bigquery_profile != null && length(v.bigquery_profile) > 0 }
}
output "datastream_connection_profiles_connection_profile_id" {
  description = "Map of connection_profile_id values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no connection_profile_id are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.connection_profile_id if v.connection_profile_id != null && length(v.connection_profile_id) > 0 }
}
output "datastream_connection_profiles_create_without_validation" {
  description = "Map of create_without_validation values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no create_without_validation are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.create_without_validation if v.create_without_validation != null }
}
output "datastream_connection_profiles_deletion_policy" {
  description = "Map of deletion_policy values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no deletion_policy are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "datastream_connection_profiles_display_name" {
  description = "Map of display_name values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no display_name are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "datastream_connection_profiles_effective_labels" {
  description = "Map of effective_labels values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no effective_labels are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "datastream_connection_profiles_forward_ssh_connectivity" {
  description = "Map of forward_ssh_connectivity values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no forward_ssh_connectivity are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.forward_ssh_connectivity) if v.forward_ssh_connectivity != null && length(v.forward_ssh_connectivity) > 0 }
  sensitive   = true
}
output "datastream_connection_profiles_gcs_profile" {
  description = "Map of gcs_profile values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no gcs_profile are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.gcs_profile) if v.gcs_profile != null && length(v.gcs_profile) > 0 }
}
output "datastream_connection_profiles_labels" {
  description = "Map of labels values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no labels are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "datastream_connection_profiles_location" {
  description = "Map of location values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no location are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.location if v.location != null && length(v.location) > 0 }
}
output "datastream_connection_profiles_mongodb_profile" {
  description = "Map of mongodb_profile values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no mongodb_profile are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.mongodb_profile) if v.mongodb_profile != null && length(v.mongodb_profile) > 0 }
  sensitive   = true
}
output "datastream_connection_profiles_mysql_profile" {
  description = "Map of mysql_profile values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no mysql_profile are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.mysql_profile) if v.mysql_profile != null && length(v.mysql_profile) > 0 }
  sensitive   = true
}
output "datastream_connection_profiles_name" {
  description = "Map of name values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no name are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.name if v.name != null && length(v.name) > 0 }
}
output "datastream_connection_profiles_oracle_profile" {
  description = "Map of oracle_profile values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no oracle_profile are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.oracle_profile) if v.oracle_profile != null && length(v.oracle_profile) > 0 }
  sensitive   = true
}
output "datastream_connection_profiles_postgresql_profile" {
  description = "Map of postgresql_profile values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no postgresql_profile are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.postgresql_profile) if v.postgresql_profile != null && length(v.postgresql_profile) > 0 }
  sensitive   = true
}
output "datastream_connection_profiles_private_connectivity" {
  description = "Map of private_connectivity values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no private_connectivity are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.private_connectivity) if v.private_connectivity != null && length(v.private_connectivity) > 0 }
}
output "datastream_connection_profiles_project" {
  description = "Map of project values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no project are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.project if v.project != null && length(v.project) > 0 }
}
output "datastream_connection_profiles_sql_server_profile" {
  description = "Map of sql_server_profile values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no sql_server_profile are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => one(v.sql_server_profile) if v.sql_server_profile != null && length(v.sql_server_profile) > 0 }
  sensitive   = true
}
output "datastream_connection_profiles_terraform_labels" {
  description = "Map of terraform_labels values across all datastream_connection_profiles, keyed the same as var.datastream_connection_profiles except keys with no terraform_labels are omitted"
  value       = { for k, v in google_datastream_connection_profile.datastream_connection_profiles : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}

