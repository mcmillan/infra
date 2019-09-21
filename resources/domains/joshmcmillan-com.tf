module "joshmcmillan-com" {
  source = "../../templates/netlify_domain"

  domain            = "joshmcmillan.com"
  netlify_subdomain = "mcmillan-brand"

  requires_email = true
}

resource "aws_route53_record" "quiet" {
  name    = "quiet.joshmcmillan.com"
  zone_id = module.joshmcmillan-com.zone_id
  type    = "CNAME"
  ttl     = 300
  records = ["mcmillan-quiet.netlify.com"]
}
