resource "grafana_dashboard" "aws" {
   provider    = grafana.cloud
   for_each    = fileset("${path.module}/dashboards/aws", "*.json")
   config_json = file("${path.module}/dashboards/aws/${each.key}")
   folder      = grafana_folder.AWS.id
}
