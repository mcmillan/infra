variable "domain_name" {
  type = string
}

variable "origin_domain_name" {
  type = string
}

variable "requires_email" {
  type    = bool
  default = false
}

variable "price_class" {
  type    = string
  default = "PriceClass_100"
}

variable "support_http2" {
  type    = bool
  default = false // this defaults to false as heroku does not support h2 rn
}

variable "cache_max_ttl" {
  type    = number
  default = 60
}
