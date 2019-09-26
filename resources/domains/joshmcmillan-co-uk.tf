module "joshmcmillan-co-uk" {
  source            = "../../templates/netlify_domain"
  domain            = "joshmcmillan.co.uk"
  netlify_subdomain = "mcmillan-canonical-redirect"

  # DO NOT EVER REMOVE BELOW LINE
  requires_email = true # SERIOUSLY DON'T REMOVE THIS LINE OR I'LL STOP GETTING EMAIL
  # DO NOT EVER REMOVE ABOVE LINE
}
