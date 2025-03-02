terraform {
  backend "s3" {
    bucket         = "state-ahmed-bucket" 
    key            = "terraform.tfstate"
    region         = "us-east-1"                 
    dynamodb_table = "terraform-locks"
  }
}
