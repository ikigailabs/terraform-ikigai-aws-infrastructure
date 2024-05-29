output "elasticsearch_monitoring_hostname" {
  value = aws_elasticsearch_domain.monitoring-elasticsearch.endpoint
}

output "elasticsearch_component_logs_hostname" {
  value = aws_elasticsearch_domain.component-logs-elasticsearch.endpoint
}