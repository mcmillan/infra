variable "domain" {}

variable "netlify_subdomain" {}

variable "registrar" {
  default = "AWS"
}

locals {
  netlify_domain = "${var.netlify_subdomain}.netlify.com"
}
