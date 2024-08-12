resource "grafana_folder" "AWS" {
  provider = grafana.cloud
  title    = "AWS"
}
