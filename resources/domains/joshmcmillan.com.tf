resource "aws_route53_zone" "joshmcmillan-com" {
  name = "joshmcmillan.com"
}

resource "aws_route53_record" "apex" {
  zone_id = "${aws_route53_zone.joshmcmillan-com.zone_id}"
  name    = "joshmcmillan.com"
  type    = "A"

  alias {
    name                   = "d394c841zfu301.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.joshmcmillan-com.zone_id}"
  name    = "www.joshmcmillan.com"
  type    = "A"

  alias {
    name                   = "s3-website-eu-west-1.amazonaws.com"
    zone_id                = "Z1BKCTXD74EZPE"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "mx" {
  zone_id = "${aws_route53_zone.joshmcmillan-com.zone_id}"
  name    = "joshmcmillan.com"
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
