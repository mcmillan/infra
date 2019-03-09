resource "aws_s3_bucket" "state" {
  bucket = "mcmillan-terraform-state"
  acl    = "private"

  versioning {
    enabled = true
  }
}
