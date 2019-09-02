module "plush-dev" {
  source = "../../templates/netlify_domain"

  domain            = "plush.dev"
  netlify_subdomain = "plush-web-prod"
  registrar         = "google"
}
