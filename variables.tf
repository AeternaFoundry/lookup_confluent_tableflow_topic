variable "tableflow_topic_lookup" {
  description = <<EOT
Map of tableflow_topic_lookup, attributes below
Required:
    - display_name
    - environment (block):
        - id (required)
    - kafka_cluster (block):
        - id (required)
Optional:
    - credentials (block):
        - key (required)
        - secret (required)
EOT

  type = map(object({
    display_name = string
    environment = object({
      id = string
    })
    kafka_cluster = object({
      id = string
    })
    credentials = optional(object({
      key    = string
      secret = string
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

