
variable "letsencrypt_email" {
  description = "email address used to register with letsencrypt"
}

variable "letsencrypt_api_endpoint" {
  default = "https://acme-v02.api.letsencrypt.org/directory"
  description = "API endpoint.  default to prod.  for staging use: https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "letsencrypt_dns_provider" {
  description = "dns provider for dns01 challenge"
  default = "cloudflare"
}

variable "app_subdomain" {
  description = "subdomain where apps will be deployed"
}

variable "cluster_cname" {
  description = "dns CNAME for master VIP"
}

variable "dns_servers" {
  type = "list"
  default = ["asa.ns.cloudflare.com"]
}
