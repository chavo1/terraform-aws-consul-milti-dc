public_dns_clients_sofia = attribute(
  "public_dns_clients_sofia",
  description: "client dns sofia"
)
public_dns_servers_sofia = attribute(
  "public_dns_servers_sofia",
  description: "server dns sofia"
)

public_dns_clients_varna = attribute(
  "public_dns_clients_varna",
  description: "client dns varna"
)
public_dns_servers_varna = attribute(
  "public_dns_servers_varna",
  description: "server dns varna"
)

  describe http("http://#{public_dns_clients_sofia[0]}:80") do
    its('status') { should cmp 200 }
  end
  describe http("http://#{public_dns_clients_sofia[0]}:8500/ui/dc1/nodes") do
    its('status') { should cmp 200 }
  end
  describe http("http://#{public_dns_clients_sofia[0]}:8500/ui/dc1/services/web") do
    its('status') { should cmp 200 }
  end
  describe http("http://#{public_dns_servers_sofia[0]}:8500/ui/dc1/nodes") do
    its('status') { should cmp 200 }
  end
  describe http("http://#{public_dns_servers_sofia[0]}:8500/ui/dc1/services/web") do
    its('status') { should cmp 200 }
  end