# use letsencrypt to generate master cert and router cert
# we'll use cloudflare as a dns challenge
provider "acme" {
  server_url = "${var.letsencrypt_api_endpoint}"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
    account_key_pem = "${tls_private_key.private_key.private_key_pem}"
    email_address   = "${var.letsencrypt_email}"
}

resource "acme_certificate" "master_certificate" {
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "${var.cluster_cname}"

  dns_challenge {
    provider = "${var.letsencrypt_dns_provider}"
  }
}

resource "acme_certificate" "app_subdomain_certificate" {
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "*.${var.app_subdomain}"

  dns_challenge {
    provider = "${var.letsencrypt_dns_provider}"
  }
}
