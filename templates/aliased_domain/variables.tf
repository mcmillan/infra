variable "domain" {}

variable "apex_name" {}
variable "apex_zone_id" {}

variable "www_name" {}
variable "www_zone_id" {}

variable "registrar" {
  default = "AWS"
}

variable "requires_email" {
  type    = bool
  default = false
}
