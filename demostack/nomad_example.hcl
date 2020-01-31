name         = "nomad-server-1"
data_dir     = "/mnt/nomad"
enable_debug = true
bind_addr = "0.0.0.0"
datacenter = "dc1"
region = "global"
server {
  enabled          = true
  bootstrap_expect = 3
  encrypt          = "OTcwOWUxNzQ0MGI4ODNlZWM2ZGE4OTg4NTMwMjc4MDU="
}
client {
  enabled = true
   options {
    "driver.raw_exec.enable" = "1"
     "docker.privileged.enabled" = "true"
  }
  meta {
    "type" = "server",
    "name" = "nomad-server-1"
  }
  host_volume "mysql_mount" {
    path      = "/opt/mysql/data/"
    read_only = false
  }
  host_volume "mongodb_mount" {
    path      = "/opt/mongodb/data/"
    read_only = false
  }
  host_volume "prometheus_mount" {
    path      = "/opt/prometheus/data/"
    read_only = false
  }
}
tls {
  rpc  = true
  http = true
  ca_file   = "/usr/local/share/ca-certificates/01-me.crt"
  cert_file = "/etc/ssl/certs/me.crt"
  key_file  = "/etc/ssl/certs/me.key"
  verify_server_hostname = false
}
consul {
    address = "localhost:8500"
    server_service_name = "nomad-server"
    client_service_name = "nomad-client"
    auto_advertise = true
    server_auto_join = true
    client_auto_join = true
}
vault {
  enabled          = true
  address          = "https://active.vault.service.consul:8200"
  ca_file          = "/usr/local/share/ca-certificates/01-me.crt"
  cert_file        = "/etc/ssl/certs/me.crt"
  key_file         = "/etc/ssl/certs/me.key"
  create_from_role = "nomad-cluster"
}
autopilot {
    cleanup_dead_servers = true
    last_contact_threshold = "200ms"
    max_trailing_logs = 250
    server_stabilization_time = "10s"
    enable_redundancy_zones = false
    disable_upgrade_migration = false
    enable_custom_upgrades = false
}
telemetry {
  publish_allocation_metrics = true
  publish_node_metrics = true
  prometheus_metrics = true
}