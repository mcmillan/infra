module "placepugs-com" {
  source = "../../templates/cdn_domain"

  domain_name        = "placepugs.com"
  origin_domain_name = "placepug.herokuapp.com"
  cache_max_ttl      = 600 // 10 minutes
}
