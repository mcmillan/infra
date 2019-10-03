module "joshmcmillan-co-uk" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.co.uk"
  netlify_subdomain = "mcmillan-canonical-redirect"

  # DO NOT EVER REMOVE BELOW LINE
  requires_email = true # SERIOUSLY DON'T REMOVE THIS LINE OR I'LL STOP GETTING EMAIL

  # DO NOT EVER REMOVE ABOVE LINE
}

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

module "josh-engineering" {
  source            = "../../templates/netlify_domain"
  domain            = "josh.engineering"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "josh-horse" {
  source            = "../../templates/netlify_domain"
  domain            = "josh.horse"
  registrar         = "iwantmyname"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "josh-party" {
  source            = "../../templates/netlify_domain"
  domain            = "josh.party"
  registrar         = "iwantmyname"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "mcmillan-sexy" {
  source            = "../../templates/netlify_domain"
  domain            = "mcmillan.sexy"
  netlify_subdomain = "mcmillan-canonical-redirect"
}

module "mcmillan-works" {
  source            = "../../templates/netlify_domain"
  domain            = "mcmillan.works"
  netlify_subdomain = "mcmillan-canonical-redirect"
}
