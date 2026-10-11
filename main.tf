data "confluent_tableflow_topic" "tableflow_topic_lookup" {
  for_each = var.tableflow_topic_lookup

  display_name = each.value.display_name

  environment {
    id = each.value.environment.id
  }

  kafka_cluster {
    id = each.value.kafka_cluster.id
  }

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }
}

