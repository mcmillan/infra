terraform {
  backend "s3" {
    bucket = "mcmillan-terraform-state"
    key    = "state"
    region = "eu-west-1"
  }
}
