## terraform-certs-letsencrypt-dns01

This is meant to be used as a module, make sure your module implementation sets all the variables in its terraform.tfvars file.

Before usage, you need to set the dns provider type (default is `cloudflare`) as well as any environment variables used for automation of the DNS service.  For more details see [https://www.terraform.io/docs/providers/acme/dns_providers/index.html](https://www.terraform.io/docs/providers/acme/dns_providers/index.html).


```terraform
module "certs" {
    source                   = "github.com/ibm-cloud-architecture/terraform-certs-letsencrypt-dns01.git"
    letsencrypt_email        = "${var.letsencrypt_email}"
    letsencrypt_dns_provider = "${var.letsencrypt_dns_provider}"
    letsencrypt_api_endpoint = "${var.letsencrypt_api_endpoint}"
    master_cname             = "${var.master_cname}-${random_id.tag.hex}"
    app_cname                = "${var.app_cname}-${random_id.tag.hex}"
}
```

## Module Inputs Variables

|Variable Name|Description|Default Value|Type|
|-------------|-----------|-------------|----|
|letsencrypt_email|Email to registrer LetsEncrypt certificates|-|string|
|letsencrypt_dns_provider|DNS provider to handle acme challenge|cloudflare|string|
|master_cname|CNAME to be used for your custom domain. Ex: `ocp-ncolon-xxxxx`|-|string|
|app_cname|CNAME to be used for your apps domain. Ex: `apps.ocp-ncolon-xxxxx`|-|string|


## Module Output

|Variable Name|Description|
|-------------|-----------|-------------|----|
|master_cert|master_cname cert|
|master_key|master_cname key|
|router_cert|app_cname cert (wildcard)|
|router_key|app_cname key|
|ca_cert|letsencrypt CA cert chain for validation|

