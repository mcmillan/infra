resource "aws_route53_zone" "domain" {
  name    = "${var.domain}"
  comment = "Managed by mcmillan/infra (registrar: ${var.registrar})"
  tags = {
    Registrar = var.registrar
  }
}
