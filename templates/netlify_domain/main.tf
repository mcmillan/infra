resource "aws_route53_zone" "zone" {
  name    = var.domain
  comment = "Managed by mcmillan/infra (registrar: ${var.registrar})"
  tags = {
    Registrar = var.registrar
  }
}

resource "aws_route53_record" "apex" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain
  type    = "A"
  ttl     = 300

  records = ["104.198.14.52"]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "www.${var.domain}"
  type    = "CNAME"
  ttl     = 300

  records = [local.netlify_domain]
}

resource "aws_route53_record" "mx" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain
  type    = "MX"
  ttl     = 300
  count   = var.requires_email == true ? 1 : 0

  records = [
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ASPMX2.GOOGLEMAIL.COM",
    "10 ASPMX3.GOOGLEMAIL.COM",
    "1 ASPMX.L.GOOGLE.COM",
  ]
}
