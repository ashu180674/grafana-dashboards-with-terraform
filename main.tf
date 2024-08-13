terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 2.9.0"
    }
  }
}

provider "grafana" {
  alias = "cloud"
  url   = "https://ashutoshtripathi1806.grafana.net"
  auth  = ""
}