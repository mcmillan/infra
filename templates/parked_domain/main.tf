resource "aws_route53_zone" "zone" {
  name    = var.domain
  comment = "Managed by mcmillan/infra (registrar: ${var.registrar})"
  tags = {
    Registrar = var.registrar
  }
}
