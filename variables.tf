variable "datastream_connection_profiles" {
  description = <<EOT
Map of datastream_connection_profiles, attributes below
Required:
    - connection_profile_id
    - display_name
    - location
Optional:
    - create_without_validation
    - deletion_policy
    - labels
    - project
    - bigquery_profile (block):
    - forward_ssh_connectivity (block):
        - hostname (required)
        - password (optional)
        - port (optional)
        - private_key (optional)
        - username (required)
    - gcs_profile (block):
        - bucket (required)
        - root_path (optional)
    - mongodb_profile (block):
        - additional_options (optional)
        - host_addresses (required, block):
            - hostname (required)
            - port (optional)
        - password (optional)
        - replica_set (optional)
        - secret_manager_stored_password (optional)
        - srv_connection_format (optional, block):
        - ssl_config (optional, block):
            - ca_certificate (optional)
            - client_certificate (optional)
            - client_key (optional)
            - secret_manager_stored_client_key (optional)
        - standard_connection_format (optional, block):
            - direct_connection (optional)
        - username (required)
    - mysql_profile (block):
        - hostname (required)
        - password (optional)
        - port (optional)
        - secret_manager_stored_password (optional)
        - ssl_config (optional, block):
            - ca_certificate (optional)
            - client_certificate (optional)
            - client_key (optional)
        - username (required)
    - oracle_profile (block):
        - connection_attributes (optional)
        - database_service (required)
        - hostname (required)
        - password (optional)
        - port (optional)
        - secret_manager_stored_password (optional)
        - username (required)
    - postgresql_profile (block):
        - database (required)
        - hostname (required)
        - password (optional)
        - port (optional)
        - secret_manager_stored_password (optional)
        - ssl_config (optional, block):
            - server_and_client_verification (optional, block):
                - ca_certificate (required)
                - client_certificate (required)
                - client_key (required)
            - server_verification (optional, block):
                - ca_certificate (required)
        - username (required)
    - private_connectivity (block):
        - private_connection (required)
    - sql_server_profile (block):
        - database (required)
        - hostname (required)
        - password (optional)
        - port (optional)
        - secret_manager_stored_password (optional)
        - username (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    connection_profile_id     = string
    display_name              = string
    location                  = string
    create_without_validation = optional(bool)
    deletion_policy           = optional(string)
    labels                    = optional(map(string))
    project                   = optional(string)
    bigquery_profile = optional(object({
    }))
    forward_ssh_connectivity = optional(object({
      hostname    = string
      password    = optional(string)
      port        = optional(number)
      private_key = optional(string)
      username    = string
    }))
    gcs_profile = optional(object({
      bucket    = string
      root_path = optional(string)
    }))
    mongodb_profile = optional(object({
      additional_options = optional(map(string))
      host_addresses = list(object({
        hostname = string
        port     = optional(number)
      }))
      password                       = optional(string)
      replica_set                    = optional(string)
      secret_manager_stored_password = optional(string)
      srv_connection_format = optional(object({
      }))
      ssl_config = optional(object({
        ca_certificate                   = optional(string)
        client_certificate               = optional(string)
        client_key                       = optional(string)
        secret_manager_stored_client_key = optional(string)
      }))
      standard_connection_format = optional(object({
        direct_connection = optional(bool)
      }))
      username = string
    }))
    mysql_profile = optional(object({
      hostname                       = string
      password                       = optional(string)
      port                           = optional(number)
      secret_manager_stored_password = optional(string)
      ssl_config = optional(object({
        ca_certificate     = optional(string)
        client_certificate = optional(string)
        client_key         = optional(string)
      }))
      username = string
    }))
    oracle_profile = optional(object({
      connection_attributes          = optional(map(string))
      database_service               = string
      hostname                       = string
      password                       = optional(string)
      port                           = optional(number)
      secret_manager_stored_password = optional(string)
      username                       = string
    }))
    postgresql_profile = optional(object({
      database                       = string
      hostname                       = string
      password                       = optional(string)
      port                           = optional(number)
      secret_manager_stored_password = optional(string)
      ssl_config = optional(object({
        server_and_client_verification = optional(object({
          ca_certificate     = string
          client_certificate = string
          client_key         = string
        }))
        server_verification = optional(object({
          ca_certificate = string
        }))
      }))
      username = string
    }))
    private_connectivity = optional(object({
      private_connection = string
    }))
    sql_server_profile = optional(object({
      database                       = string
      hostname                       = string
      password                       = optional(string)
      port                           = optional(number)
      secret_manager_stored_password = optional(string)
      username                       = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.datastream_connection_profiles : (
        v.mongodb_profile == null || (length(v.mongodb_profile.host_addresses) >= 1)
      )
    ])
    error_message = "Each host_addresses list must contain at least 1 items"
  }
}

