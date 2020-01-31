cluster_name = "DC1-Demostack"
storage "consul" {
  path = "vault/"
  service = "vault"
}
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "/etc/vault.d/tls/vault.crt"
  tls_key_file  = "/etc/ssl/certs/me.key"
   tls-skip-verify = true
}
seal "awskms" {
  region = "eu-west-2"
  kms_key_id = "f9e12702-b1fb-4260-be68-4747a330131e"
}
telemetry {
  prometheus_retention_time = "30s",
  disable_hostname = true
}
disable_mlock = true
ui = true