module "joshmcmillan-com" {
  source = "../../templates/netlify_domain"

  domain            = "joshmcmillan.com"
  netlify_subdomain = "mcmillan-brand"
}
