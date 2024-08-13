resource "grafana_dashboard" "aws" {
  provider    = grafana.cloud
  for_each    = fileset("${path.module}/Dashboards/AWS", "*.json")
  config_json = file("${path.module}/Dashboards/AWS/${each.key}")
  folder      = grafana_folder.AWS.id
}
