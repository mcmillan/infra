resource "aws_route53_zone" "zone" {
  name    = "${var.domain}"
  comment = "Managed by mcmillan/infra (registrar: ${var.registrar})"
  tags = {
    Registrar = var.registrar
  }
}

resource "aws_route53_record" "apex" {
  zone_id = "${aws_route53_zone.zone.zone_id}"
  name    = "${var.domain}"
  type    = "A"

  alias {
    name                   = "${var.apex_name}"
    zone_id                = "${var.apex_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.zone.zone_id}"
  name    = "www.${var.domain}"
  type    = "A"

  alias {
    name                   = "${var.www_name}"
    zone_id                = "${var.www_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "mx" {
  zone_id = "${aws_route53_zone.zone.zone_id}"
  name    = "${var.domain}"
  type    = "MX"
  ttl     = 300

  records = [
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ASPMX2.GOOGLEMAIL.COM",
    "10 ASPMX3.GOOGLEMAIL.COM",
    "1 ASPMX.L.GOOGLE.COM",
  ]
}
