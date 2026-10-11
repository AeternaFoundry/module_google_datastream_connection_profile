resource "google_datastream_connection_profile" "datastream_connection_profiles" {
  for_each = var.datastream_connection_profiles

  connection_profile_id     = each.value.connection_profile_id
  display_name              = each.value.display_name
  location                  = each.value.location
  create_without_validation = each.value.create_without_validation
  deletion_policy           = each.value.deletion_policy
  labels                    = each.value.labels
  project                   = each.value.project

  dynamic "bigquery_profile" {
    for_each = each.value.bigquery_profile != null ? [each.value.bigquery_profile] : []
    content {
    }
  }

  dynamic "forward_ssh_connectivity" {
    for_each = each.value.forward_ssh_connectivity != null ? [each.value.forward_ssh_connectivity] : []
    content {
      hostname    = forward_ssh_connectivity.value.hostname
      password    = forward_ssh_connectivity.value.password
      port        = forward_ssh_connectivity.value.port
      private_key = forward_ssh_connectivity.value.private_key
      username    = forward_ssh_connectivity.value.username
    }
  }

  dynamic "gcs_profile" {
    for_each = each.value.gcs_profile != null ? [each.value.gcs_profile] : []
    content {
      bucket    = gcs_profile.value.bucket
      root_path = gcs_profile.value.root_path
    }
  }

  dynamic "mongodb_profile" {
    for_each = each.value.mongodb_profile != null ? [each.value.mongodb_profile] : []
    content {
      additional_options = mongodb_profile.value.additional_options
      dynamic "host_addresses" {
        for_each = mongodb_profile.value.host_addresses
        content {
          hostname = host_addresses.value.hostname
          port     = host_addresses.value.port
        }
      }
      password                       = mongodb_profile.value.password
      replica_set                    = mongodb_profile.value.replica_set
      secret_manager_stored_password = mongodb_profile.value.secret_manager_stored_password
      dynamic "srv_connection_format" {
        for_each = mongodb_profile.value.srv_connection_format != null ? [mongodb_profile.value.srv_connection_format] : []
        content {
        }
      }
      dynamic "ssl_config" {
        for_each = mongodb_profile.value.ssl_config != null ? [mongodb_profile.value.ssl_config] : []
        content {
          ca_certificate                   = ssl_config.value.ca_certificate
          client_certificate               = ssl_config.value.client_certificate
          client_key                       = ssl_config.value.client_key
          secret_manager_stored_client_key = ssl_config.value.secret_manager_stored_client_key
        }
      }
      dynamic "standard_connection_format" {
        for_each = mongodb_profile.value.standard_connection_format != null ? [mongodb_profile.value.standard_connection_format] : []
        content {
          direct_connection = standard_connection_format.value.direct_connection
        }
      }
      username = mongodb_profile.value.username
    }
  }

  dynamic "mysql_profile" {
    for_each = each.value.mysql_profile != null ? [each.value.mysql_profile] : []
    content {
      hostname                       = mysql_profile.value.hostname
      password                       = mysql_profile.value.password
      port                           = mysql_profile.value.port
      secret_manager_stored_password = mysql_profile.value.secret_manager_stored_password
      dynamic "ssl_config" {
        for_each = mysql_profile.value.ssl_config != null ? [mysql_profile.value.ssl_config] : []
        content {
          ca_certificate     = ssl_config.value.ca_certificate
          client_certificate = ssl_config.value.client_certificate
          client_key         = ssl_config.value.client_key
        }
      }
      username = mysql_profile.value.username
    }
  }

  dynamic "oracle_profile" {
    for_each = each.value.oracle_profile != null ? [each.value.oracle_profile] : []
    content {
      connection_attributes          = oracle_profile.value.connection_attributes
      database_service               = oracle_profile.value.database_service
      hostname                       = oracle_profile.value.hostname
      password                       = oracle_profile.value.password
      port                           = oracle_profile.value.port
      secret_manager_stored_password = oracle_profile.value.secret_manager_stored_password
      username                       = oracle_profile.value.username
    }
  }

  dynamic "postgresql_profile" {
    for_each = each.value.postgresql_profile != null ? [each.value.postgresql_profile] : []
    content {
      database                       = postgresql_profile.value.database
      hostname                       = postgresql_profile.value.hostname
      password                       = postgresql_profile.value.password
      port                           = postgresql_profile.value.port
      secret_manager_stored_password = postgresql_profile.value.secret_manager_stored_password
      dynamic "ssl_config" {
        for_each = postgresql_profile.value.ssl_config != null ? [postgresql_profile.value.ssl_config] : []
        content {
          dynamic "server_and_client_verification" {
            for_each = ssl_config.value.server_and_client_verification != null ? [ssl_config.value.server_and_client_verification] : []
            content {
              ca_certificate     = server_and_client_verification.value.ca_certificate
              client_certificate = server_and_client_verification.value.client_certificate
              client_key         = server_and_client_verification.value.client_key
            }
          }
          dynamic "server_verification" {
            for_each = ssl_config.value.server_verification != null ? [ssl_config.value.server_verification] : []
            content {
              ca_certificate = server_verification.value.ca_certificate
            }
          }
        }
      }
      username = postgresql_profile.value.username
    }
  }

  dynamic "private_connectivity" {
    for_each = each.value.private_connectivity != null ? [each.value.private_connectivity] : []
    content {
      private_connection = private_connectivity.value.private_connection
    }
  }

  dynamic "sql_server_profile" {
    for_each = each.value.sql_server_profile != null ? [each.value.sql_server_profile] : []
    content {
      database                       = sql_server_profile.value.database
      hostname                       = sql_server_profile.value.hostname
      password                       = sql_server_profile.value.password
      port                           = sql_server_profile.value.port
      secret_manager_stored_password = sql_server_profile.value.secret_manager_stored_password
      username                       = sql_server_profile.value.username
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

