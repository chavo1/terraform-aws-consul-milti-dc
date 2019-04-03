module "consul_sofia" {
  source = "github.com/chavo1/terraform-aws-consul"

  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  region        = "${var.region}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  subnet        = "${var.subnet[0]}"
  client_count  = "${var.client_count}"
  server_count  = "${var.server_count}"
  dc_net        = "${var.dc_net["dc1"]}"
  dcname        = "${var.dcname["dc1"]}"
}

module "consul_varna" {
  source = "github.com/chavo1/terraform-aws-consul"

  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  region        = "${var.region}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  subnet        = "${var.subnet[1]}"
  client_count  = "${var.client_count}"
  server_count  = "${var.server_count}"
  dc_net        = "${var.dc_net["dc2"]}"
  dcname        = "${var.dcname["dc2"]}"
}

output "public_dns_servers_sofia" {
  value = "${module.consul_sofia.public_dns_servers}"
}

output "public_dns_clients_sofia" {
  value = "${module.consul_sofia.public_dns_clients}"
}

output "public_dns_servers_varna" {
  value = "${module.consul_varna.public_dns_servers}"
}

output "public_dns_clients_varna" {
  value = "${module.consul_varna.public_dns_clients}"
}
