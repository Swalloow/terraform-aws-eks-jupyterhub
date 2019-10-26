terraform {
  required_version = ">= 0.12.6"

  backend "s3" {
    bucket         = "terraform-swalloow"
    key            = "terraform-root-vpc/tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-resource-lock"
  }
}
