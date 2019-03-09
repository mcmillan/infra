variable "domain" {}

variable "netlify_subdomain" {}

locals {
  netlify_domain = "${var.netlify_subdomain}.netlify.com"
}
