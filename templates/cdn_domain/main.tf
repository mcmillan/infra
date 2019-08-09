provider "aws" {
  alias  = "murica"
  region = "us-east-1"
}

// dns
resource "aws_route53_zone" "zone" {
  name    = var.domain_name
  comment = "Managed by mcmillan/infra (registrar: ${var.registrar})"
  tags = {
    Registrar = var.registrar
  }
}

resource "aws_route53_record" "apex" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.distribution.domain_name
    zone_id                = aws_cloudfront_distribution.distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.distribution.domain_name
    zone_id                = aws_cloudfront_distribution.distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "mx" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain_name
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

// cert
resource "aws_acm_certificate" "cert" {
  provider                  = aws.murica
  domain_name               = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method         = "DNS"
}

// cert verification
resource "aws_route53_record" "cert-verification" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = aws_acm_certificate.cert.domain_validation_options[count.index].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[count.index].resource_record_type
  records = [aws_acm_certificate.cert.domain_validation_options[count.index].resource_record_value]
  ttl     = 60
  count   = 2
}

resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.murica
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = aws_route53_record.cert-verification.*.fqdn
}

// cdn
resource "aws_cloudfront_distribution" "distribution" {
  origin {
    origin_id   = "default"
    domain_name = var.origin_domain_name

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled         = true
  is_ipv6_enabled = true
  http_version    = var.support_http2 ? "http2" : "http1.1"
  price_class     = var.price_class

  aliases = [var.domain_name, "www.${var.domain_name}"]

  default_cache_behavior {
    target_origin_id = "default"
    allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "PATCH", "POST", "DELETE"]
    cached_methods   = ["GET", "HEAD"]
    compress         = true
    default_ttl      = 0
    min_ttl          = 0
    max_ttl          = var.cache_max_ttl

    forwarded_values {
      cookies {
        forward = "all"
      }

      headers      = ["Host"]
      query_string = true
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert.certificate_arn
    minimum_protocol_version = "TLSv1.2_2018"
    ssl_support_method       = "sni-only"
  }
}
