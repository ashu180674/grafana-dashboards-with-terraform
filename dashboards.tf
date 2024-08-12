resource "grafana_dashboard" "aws" {
  provider    = grafana.cloud
  for_each    = fileset("${path.module}/Dashboards/aws", "*.json")
  config_json = file("${path.module}/Dashboards/aws/${each.key}")
  folder      = grafana_folder.AWS.id
}
