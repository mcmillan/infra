module "joshmcmillan-com" {
  source = "../../templates/portfolio_domain"

  domain = "joshmcmillan.com"

  apex_name    = "d394c841zfu301.cloudfront.net."
  apex_zone_id = "Z2FDTNDATAQYW2"

  www_name    = "s3-website-eu-west-1.amazonaws.com."
  www_zone_id = "Z1BKCTXD74EZPE"
}
