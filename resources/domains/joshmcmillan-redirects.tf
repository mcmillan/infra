module "joshmcmillan-net" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.net"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "joshmcmillan-uk" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.uk"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "joshmcmillan-org" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.org"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "joshmcmillan-me" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.me"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "joshmcmillan-co" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.co"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "joshmcmillan-eu" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.eu"
  netlify_subdomain = "mcmillan-canonical-redirect"
}
