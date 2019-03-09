module "joshmcmillan-co-uk" {
  source = "../../templates/aliased_domain"

  domain = "joshmcmillan.co.uk"

  apex_name    = "s3-website-eu-west-1.amazonaws.com."
  apex_zone_id = "Z1BKCTXD74EZPE"

  www_name    = "s3-website-eu-west-1.amazonaws.com."
  www_zone_id = "Z1BKCTXD74EZPE"
}
