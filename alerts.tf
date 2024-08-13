resource "grafana_contact_point" "contact_point_infra_team" {
  provider           = grafana.cloud
  name               = "Infra_team"
  disable_provenance = true
  email {
    addresses = ["ashutosh.tripathi@vance.tech"]
  }
}

resource "grafana_rule_group" "rule_group_d6051cb931e88db8" {
  provider           = grafana.cloud
  name               = "evaluation1"
  folder_uid         = grafana_folder.AWS.uid
  interval_seconds   = 60
  disable_provenance = true

  rule {
    name      = "CPU Usage per Container"
    condition = "B"

    data {
      ref_id = "F"

      relative_time_range {
        from = 3600
        to   = 0
      }

      datasource_uid = "adtl5shqu4j5sa"
      model          = "{\"alias\":\"\",\"datasource\":{\"type\":\"cloudwatch\",\"uid\":\"adtl5shqu4j5sa\"},\"dimensions\":{\"ClusterName\":\"staging-app-server\",\"ServiceName\":\"*\"},\"expr\":\"sum(rate(container_cpu_usage_seconds_total{name=~\\\".+\\\",instance=~\\\"$node\\\"}[5m])) by (name) * 100\",\"expression\":\"\",\"format\":\"time_series\",\"id\":\"\",\"interval\":\"\",\"intervalFactor\":2,\"intervalMs\":1000,\"label\":\"\",\"legendFormat\":\"{{name}}\",\"logGroups\":[],\"matchExact\":false,\"maxDataPoints\":43200,\"metric\":\"\",\"metricEditorMode\":0,\"metricName\":\"CPUUtilization\",\"metricQueryType\":0,\"namespace\":\"AWS/ECS\",\"period\":\"\",\"queryMode\":\"Metrics\",\"refId\":\"F\",\"region\":\"default\",\"sqlExpression\":\"\",\"statistic\":\"Average\",\"step\":240}"
    }
    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"A\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"F\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"A\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[80],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"B\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "Ss3q6hSZk21"
      __panelId__      = "1"
      summary          = "Cpu utlization > 80%"
    }
    labels = {
      panel = "cpu utilization"
    }
    is_paused = false

    notification_settings {
      contact_point = "Infra_team"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "memory utilization"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 3600
        to   = 0
      }

      datasource_uid = "adtl5shqu4j5sa"
      model          = "{\"alias\":\"\",\"datasource\":{\"type\":\"cloudwatch\",\"uid\":\"adtl5shqu4j5sa\"},\"dimensions\":{\"ClusterName\":[\"staging-app-server\"],\"ServiceName\":[\"*\"]},\"expr\":\"rate(container_network_receive_bytes_total{name!=\\\"\\\",instance=~\\\"$node\\\"}[5m])\",\"expression\":\"\",\"format\":\"time_series\",\"id\":\"\",\"intervalFactor\":2,\"intervalMs\":1000,\"label\":\"\",\"legendFormat\":\"{{name}}\",\"logGroups\":[],\"matchExact\":false,\"maxDataPoints\":43200,\"metricEditorMode\":0,\"metricName\":\"MemoryUtilized\",\"metricQueryType\":0,\"namespace\":\"ECS/ContainerInsights\",\"period\":\"\",\"queryMode\":\"Metrics\",\"refId\":\"A\",\"region\":\"default\",\"sqlExpression\":\"\",\"statistic\":\"Average\",\"step\":240}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[800],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "Ss3q6hSZk21"
      __panelId__      = "49"
      summary          = "memory utilization > 800MB"
    }
    labels    = {}
    is_paused = false

    notification_settings {
      contact_point = "Infra_team"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "count"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "adtl5shqu4j5sa"
      model          = "{\"datasource\":{\"type\":\"cloudwatch\",\"uid\":\"adtl5shqu4j5sa\"},\"dimensions\":{\"ApiName\":\"stage-app-server\",\"Stage\":\"stage\"},\"expression\":\"\",\"id\":\"\",\"intervalMs\":1000,\"label\":\"$${PROP('MetricName')} $${PROP('Stat')}\",\"logGroups\":[],\"matchExact\":true,\"maxDataPoints\":43200,\"metricEditorMode\":0,\"metricName\":\"Count\",\"metricQueryType\":0,\"namespace\":\"AWS/ApiGateway\",\"period\":\"\",\"queryMode\":\"Metrics\",\"refId\":\"A\",\"region\":\"default\",\"sqlExpression\":\"\",\"statistic\":\"Sum\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 10800
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[400],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      summary = "traffic increased\nrequest > 400/min"
    }
    labels    = {}
    is_paused = false

    notification_settings {
      contact_point = "Infra_team"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "pending task count"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "adtl5shqu4j5sa"
      model          = "{\"datasource\":{\"type\":\"cloudwatch\",\"uid\":\"adtl5shqu4j5sa\"},\"dimensions\":{\"ClusterName\":\"staging-app-server\",\"ServiceName\":\"*\"},\"expression\":\"\",\"hide\":false,\"id\":\"\",\"intervalMs\":1000,\"label\":\"\",\"logGroups\":[],\"matchExact\":false,\"maxDataPoints\":43200,\"metricEditorMode\":0,\"metricName\":\"PendingTaskCount\",\"metricQueryType\":0,\"namespace\":\"ECS/ContainerInsights\",\"period\":\"\",\"queryMode\":\"Metrics\",\"refId\":\"A\",\"region\":\"default\",\"sqlExpression\":\"\",\"statistic\":\"Sum\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 600
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0.5],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      __dashboardUid__ = "Ss3q6hSZk21"
      __panelId__      = "47"
      summary          = "Last deployment failed"
    }
    is_paused = true

    notification_settings {
      contact_point = "Infra_team"
      group_by      = null
      mute_timings  = null
    }
  }
  rule {
    name      = "p99 Latency"
    condition = "C"

    data {
      ref_id = "A"

      relative_time_range {
        from = 604800
        to   = 0
      }

      datasource_uid = "adtl5shqu4j5sa"
      model          = "{\"datasource\":{\"type\":\"cloudwatch\",\"uid\":\"adtl5shqu4j5sa\"},\"dimensions\":{},\"expression\":\"\",\"hide\":false,\"id\":\"\",\"intervalMs\":1000,\"label\":\"\",\"logGroups\":[],\"matchExact\":false,\"maxDataPoints\":43200,\"metricEditorMode\":0,\"metricName\":\"Latency\",\"metricQueryType\":0,\"namespace\":\"AWS/ApiGateway\",\"period\":\"900\",\"queryMode\":\"Metrics\",\"refId\":\"A\",\"region\":\"default\",\"sqlExpression\":\"\",\"statistic\":\"p99\"}"
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 604800
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"B\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"A\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"reducer\":\"last\",\"refId\":\"B\",\"type\":\"reduce\"}"
    }
    data {
      ref_id = "C"

      relative_time_range {
        from = 604800
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[10000],\"type\":\"gt\"},\"operator\":{\"type\":\"and\"},\"query\":{\"params\":[\"C\"]},\"reducer\":{\"params\":[],\"type\":\"last\"},\"type\":\"query\"}],\"datasource\":{\"type\":\"__expr__\",\"uid\":\"__expr__\"},\"expression\":\"B\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"C\",\"type\":\"threshold\"}"
    }

    no_data_state  = "NoData"
    exec_err_state = "Error"
    for            = "1m"
    annotations = {
      summary = "p99 latency >10k"
    }
    labels    = {}
    is_paused = false

    notification_settings {
      contact_point = "Infra_team"
      group_by      = null
      mute_timings  = null
    }
  }
}