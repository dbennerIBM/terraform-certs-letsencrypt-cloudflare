output "master_cert" {
  value = "${acme_certificate.master_certificate.certificate_pem}${acme_certificate.master_certificate.issuer_pem}"
}

output "master_key" {
  value = "${acme_certificate.master_certificate.private_key_pem}"
}

output "router_cert" {
  value = "${acme_certificate.app_subdomain_certificate.certificate_pem}${acme_certificate.app_subdomain_certificate.issuer_pem}"
}

output "router_key" {
  value = "${acme_certificate.app_subdomain_certificate.private_key_pem}"
}

data "external" "letsencrypt_ca_cert" {
  program = ["sh", "${path.module}/scripts/get_letsencrypt_ca_cert.sh"]
  

  query = {
  }
}

# write out the letsencrypt CA
output "ca_cert" {
    value = "${base64decode(data.external.letsencrypt_ca_cert.result["cert64"])}"
}
