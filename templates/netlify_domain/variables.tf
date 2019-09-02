variable "domain" {}

variable "netlify_subdomain" {}

variable "registrar" {
  default = "AWS"
}

variable "requires_email" {
  type    = bool
  default = false
}

locals {
  netlify_domain = "${var.netlify_subdomain}.netlify.com"
}
