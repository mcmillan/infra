module "placepu-gs" {
  source = "../../templates/aliased_domain"

  domain = "placepu.gs"

  apex_name    = "s3-website-eu-west-1.amazonaws.com."
  apex_zone_id = "Z1BKCTXD74EZPE"

  www_name    = "s3-website-eu-west-1.amazonaws.com."
  www_zone_id = "Z1BKCTXD74EZPE"

  registrar = "iwantmyname"
}
