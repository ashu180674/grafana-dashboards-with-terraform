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
  auth  = "glsa_KW9gZpB1UTn9n1MGjcuvWJ8CFI3BzAH1_8cb59580"
}