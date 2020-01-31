{
  "datacenter": "eu-west-2",
  "primary_datacenter":  "eu-west-2",
  "bootstrap_expect": 3,
  "advertise_addr": "10.1.1.155",
  "advertise_addr_wan": "18.130.129.0",
  "bind_addr": "0.0.0.0",
  "client_addr": "0.0.0.0",
  "data_dir": "/mnt/consul",
  "encrypt": "MTI0OTE5MzlkMmQzNmNhMzExMzBjYTEwYzJhNDA5NmE=",
  "leave_on_terminate": true,
  "node_name": "EU-guystack-server-0",
  "retry_join": ["provider=aws tag_key=ConsulJoin tag_value=primarystack-f639b7efede087f99a32caaa999d5978"],
  "server": true,
  "ports": {
    "http": 8500,
    "https": 8501,
    "grpc": 8502
  },
  "connect":{
    "enabled": true
  },
  "ui": true,
  "enable_central_service_config":true,
  "autopilot": {
    "cleanup_dead_servers": true,
    "last_contact_threshold": "200ms",
    "max_trailing_logs": 250,
    "server_stabilization_time": "10s",
    "disable_upgrade_migration": false
  },
  "telemetry": {
    "disable_hostname": true,
    "prometheus_retention_time": "30s"
  }
}